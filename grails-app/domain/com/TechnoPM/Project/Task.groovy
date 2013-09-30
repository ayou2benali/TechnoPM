package com.TechnoPM.Project

import com.TechnoPM.Person

class Task {
  static embedded = { "events" }

  String name
  String description
  Status status

  Date createdDate

  SortedSet<Comment> comments
  SortedSet<TaskEvent> events
  SortedSet<File> files

  static hasMany = [
    events: TaskEvent,
    files: File,
    comments: Comment,
  ]

  static belongsTo = [
    author: Person,
    assignee: Person,
    project: Project,
    requirment: Requirement
  ]

  static constraints = {
  }
}
