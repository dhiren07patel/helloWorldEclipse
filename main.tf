provider "google" {
  credentials = file("klara-comm-nonprod-b8db0085dec5.json")
  project     = "klara-comm-nonprod"
  #region      = "us-central1"  # Adjust to your desired region
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
    push_endpoint = "https://helloworldeclipse-service-dot-klara-epost-prod-doc2epost.oa.r.appspot.com"

    attributes = {
      x-goog-version = "v1"
    }
  }
}