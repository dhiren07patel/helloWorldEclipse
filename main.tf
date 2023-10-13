provider "google" {
  credentials = file("klara-comm-nonprod-b8db0085dec5.json")
  project     = "klara-comm-nonprod"
  region      = "us-east4" # Adjust to your desired region
}

# resource "google_cloud_run_service" "helloworldeclipse" {
#   name     = "helloworldeclipse"
#   location = "us-east4"
#   project  = "klara-comm-nonprod"

#   template {
#     spec {
#       containers {
#         image = "gcr.io/klara-comm-nonprod/helloworldeclipse:latest"
#       }
#     }
#   }
# }

resource "google_cloud_run_v2_service" "helloworldeclipse" {
  name     = "helloworldeclipse"
  location = "us-east4"
  project  = "klara-comm-nonprod"

  template {
    containers {
      image = "gcr.io/klara-comm-nonprod/helloworldeclipse@sha256:a239b48a587284200ae8cab2c9dbd4da7fa7aa64b56760b491eced0344b69e06"
    }
  }
}

resource "google_pubsub_topic" "helloWorldEclipse-service" {
  name = "helloWorldEclipse-service"
}

resource "google_pubsub_subscription" "helloWorldEclise-service-push-sub" {
  name  = "helloWorldEclise-service-push-sub"
  topic = google_pubsub_topic.helloWorldEclipse-service.name

  ack_deadline_seconds = 20

  labels = {
    foo = "bar"
  }

  push_config {
    push_endpoint = "https://helloworldeclipse-service-dot-klara-comm-nonprod.oa.r.appspot.com/getEclipse"

    attributes = {
      x-goog-version = "v1"
    }
  }
}
