#!/bin/bash
echo "Scailing istio gateway..."
kubectl patch hpa istio-secure-ingressgateway -n istio-system -p '{"spec":{"minReplicas":10,"maxReplicas":10}}'
echo "Scailing lovebird..."
kubectl patch deployment lovebird -n lovebird -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "lark-app",
            "resources": {
              "requests": {
                "cpu": "1200m",
                "memory": "1Gi"
              },
              "limits": {
                "cpu": "1200m",
                "memory": "1Gi"
              }
            }
          }
        ]
      }
    }
  }
}'
kubectl patch hpa lovebird -n lovebird -p '{"spec":{"minReplicas":8,"maxReplicas":8}}'
echo "Scailing Peacock..."
kubectl patch deployment peacock-service-staging-lark-app -n peacock -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "lark-app",
            "resources": {
              "requests": {
                "cpu": "3",
                "memory": "5Gi"
              },
              "limits": {
                "cpu": "3",
                "memory": "5Gi"
              }
            }
          }
        ]
      }
    }
  }
}'
kubectl patch hpa peacock-service-staging-lark-app -n peacock -p '{"spec":{"minReplicas":10,"maxReplicas":10}}'
echo "Scailing Peacock..."
kubectl patch deployment peacock-service-prod-us-west-2-lark-app -n peacock -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "lark-app",
            "resources": {
              "requests": {
                "cpu": "3",
                "memory": "5Gi"
              },
              "limits": {
                "cpu": "3",
                "memory": "5Gi"
              }
            }
          }
        ]
      }
    }
  }
}'
kubectl patch hpa peacock-service-prod-us-west-2-lark-app -n peacock -p '{"spec":{"minReplicas":10,"maxReplicas":10}}'
echo "Scailing Pelican..."
kubectl patch hpa pelican -n pelican -p '{"spec":{"minReplicas":10,"maxReplicas":10}}'
kubectl patch deployment pelican -n pelican -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "lark-app",
            "resources": {
              "requests": {
                "cpu": "2",
                "memory": "1Gi"
              },
              "limits": {
                "cpu": "2",
                "memory": "1Gi"
              }
            }
          }
        ]
      }
    }
  }
}'
echo "Scailing Goldfinch..."
kubectl patch statefulset goldfinch-goldfinch-replicas -n goldfinch -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "goldfinch",
            "resources": {
              "requests": {
                "cpu": "6",
                "memory": "12Gi"
              },
              "limits": {
                "cpu": "6",
                "memory": "12Gi"
              }
            }
          }
        ]
      }
    }
  }
}'
kubectl scale statefulset goldfinch-goldfinch-replicas -n goldfinch --replicas=14
echo "Scailing Larksettings..."
kubectl patch deploy goldfinch-larksettings-non -n goldfinch -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "larksettings",
            "resources": {
              "requests": {
                "cpu": "4",
                "memory": "9Gi"
              },
              "limits": {
                "cpu": "4",
                "memory": "9Gi"
              }
            }
          }
        ]
      }
    }
  }
}'
kubectl scale deploy goldfinch-larksettings-non -n goldfinch --replicas=6
kubectl patch deploy goldfinch-larksettings-lark -n goldfinch -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "larksettings",
            "resources": {
              "requests": {
                "cpu": "4",
                "memory": "9Gi"
              },
              "limits": {
                "cpu": "4",
                "memory": "9Gi"
              }
            }
          }
        ]
      }
    }
  }
}'
kubectl scale deploy goldfinch-larksettings-lark -n goldfinch --replicas=6
kubectl patch deploy goldfinch-larksettings-anthem -n goldfinch -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "larksettings",
            "resources": {
              "requests": {
                "cpu": "4",
                "memory": "9Gi"
              },
              "limits": {
                "cpu": "4",
                "memory": "9Gi"
              }
            }
          }
        ]
      }
    }
  }
}'
kubectl scale deploy goldfinch-larksettings-anthem -n goldfinch --replicas=6
echo "Scailing eligibility service..."
kubectl patch hpa eligibility-service -n eligibility-service -p '{"spec":{"minReplicas":2,"maxReplicas":2}}'
echo "Scailing keycloak..."
kubectl patch statefulset keycloak -n keycloak -p '{
  "spec": {
    "template": {
      "spec": {
        "containers": [
          {
            "name": "keycloak",
            "resources": {
              "requests": {
                "cpu": "4",
                "memory": "6Gi"
              },
              "limits": {
                "cpu": "4",
                "memory": "6Gi"
              }
            }
          }
        ]
      }
    }
  }
}'
