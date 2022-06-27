project = "pypy_0bniur37"
config {
    env = {
      DISABLE_COLLECTSTATIC = {
        value = 1
      }
    }
  }

app "pypy_0bniur37" {
  
  build {
    use "pack" {
      builder = "heroku/buildpacks:20"
      buildpacks = ["heroku/python"]
      static_environment = ["DISABLE_COLLECTSTATIC"="1"]
      #disable_entrypoint = true
    }
    registry {
      use "docker" {
        image = var.ecr_repo
        tag   = var.image_tag
      }
    }
  }
  deploy {
    use "docker" {
    }
  }
}

variable "image_tag" {
  type    = string
}

variable "ecr_repo" {
  type    = string
}

