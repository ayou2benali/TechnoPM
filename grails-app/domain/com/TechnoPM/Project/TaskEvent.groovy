package com.TechnoPM.Project

import com.TechnoPM.Person

class TaskEvent implements Comparable {
  String description
  Date creationDate

  static belongsTo = [task: Task, creator: Person]

  static constraints = {
  }

  @Override
  int compareTo(obj) {
    creationDate.compareTo(obj.creationDate)
  }
}
