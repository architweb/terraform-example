resource "aws_cloudwatch_dashboard" "default" {
  dashboard_name = "Main"
  dashboard_body = jsonencode({
    "widgets" : [
      module.widget_app.widget,
      module.widget_db.widget,
      module.widget_staging.widget
    ]
  })
}

module "widget_app" {
  source = "./modules/aw-cloudwatch-widget"

  region      = var.aws_region
  name        = "Web App"
  resource_id = module.app.id
}

module "widget_db" {
  source = "./modules/aw-cloudwatch-widget"

  region      = var.aws_region
  name        = "DB"
  resource_id = aws_db_instance.db.id
  type        = "rds"
}

module "widget_staging" {
  source = "./modules/aw-cloudwatch-widget"

  region      = var.aws_region
  name        = "Staging"
  resource_id = module.staging.id
}
