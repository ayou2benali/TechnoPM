package com.TechnoPM.Project

import com.TechnoPM.Person

class Comment implements Comparable{

  String comment
  Date creationDate
  
  static belongsTo = [author: Person]

  static constraints = {
  }

  @Override
  int compareTo(obj) {
    creationDate.compareTo(obj.creationDate)
  }
}
