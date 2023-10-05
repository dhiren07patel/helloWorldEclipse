provider "google" {
  credentials = file("klara-comm-nonprod-b8db0085dec5.json")
  project     = "klara-comm-nonprod"
  region      = "us-central1"  # Adjust to your desired region
}

resource "google_cloud_run_service" "run_service" {
  name = "helloWorldEclipse"
  location = "us-europe-west1"

  template {
	spec {
  	containers {
    	image = "gcr.io/klara-comm-nonprod/helloworldeclipse@sha256:eb4bbb84867ccb6f9e0db68f175034a02f2d5ca1badd5af2ad360ca5fefbd19d"
  	}
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
