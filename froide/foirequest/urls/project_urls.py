from django.urls import path

from ..views import (
    ProjectActionView,
    ProjectView,
    SetProjectTeamView,
    make_project_public,
)

urlpatterns = [
    path("<slug:slug>/", ProjectView.as_view(), name="foirequest-project"),
    path(
        "<slug:slug>/set-team/",
        SetProjectTeamView.as_view(),
        name="foirequest-project_set_team",
    ),
    path(
        "<slug:slug>/make-public/",
        make_project_public,
        name="foirequest-project_make_public",
    ),
    path(
        "<slug:slug>/action/",
        ProjectActionView.as_view(),
        name="foirequest-project_execute_action",
    ),
]
