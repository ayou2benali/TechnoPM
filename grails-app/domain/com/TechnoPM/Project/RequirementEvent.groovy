package com.TechnoPM.Project

import com.TechnoPM.Person

class RequirementEvent implements Comparable {
  String description
  Date creationDate
  
  static belongsTo = [requirement: Requirement, creator: Person]

  static constraints = {
  }

  @Override
  int compareTo(obj) {
    creationDate.compareTo(obj.creationDate)
  }
}
