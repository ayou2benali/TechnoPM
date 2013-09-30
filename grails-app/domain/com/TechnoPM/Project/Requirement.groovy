package com.TechnoPM.Project

import com.TechnoPM.Person

class Requirement {
  static embedded = { "events" }

  String name
  SortedSet<RequirementEvent> events
  SortedSet<Comment> comments
  SortedSet<Task> tasks

  static belongsTo = [project: Project, status: Status]
  static hasMany = [
    events: RequirementEvent,
    comments: Comment,
    author: Person,
    assignee: Person,
    tasks: Task
  ]

  static constraints = {
  }
}
