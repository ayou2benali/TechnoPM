package com.TechnoPM.Project

import org.springframework.dao.DataIntegrityViolationException

class SubtaskController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [subtaskInstanceList: Subtask.list(params), subtaskInstanceTotal: Subtask.count()]
    }

    def create() {
        [subtaskInstance: new Subtask(params)]
    }

    def save() {
        def subtaskInstance = new Subtask(params)
        if (!subtaskInstance.save(flush: true)) {
            render(view: "create", model: [subtaskInstance: subtaskInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'subtask.label', default: 'Subtask'), subtaskInstance.id])
        redirect(action: "show", id: subtaskInstance.id)
    }

    def show(Long id) {
        def subtaskInstance = Subtask.get(id)
        if (!subtaskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtask.label', default: 'Subtask'), id])
            redirect(action: "list")
            return
        }

        [subtaskInstance: subtaskInstance]
    }

    def edit(Long id) {
        def subtaskInstance = Subtask.get(id)
        if (!subtaskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtask.label', default: 'Subtask'), id])
            redirect(action: "list")
            return
        }

        [subtaskInstance: subtaskInstance]
    }

    def update(Long id, Long version) {
        def subtaskInstance = Subtask.get(id)
        if (!subtaskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtask.label', default: 'Subtask'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (subtaskInstance.version > version) {
                subtaskInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'subtask.label', default: 'Subtask')] as Object[],
                        "Another user has updated this Subtask while you were editing")
                render(view: "edit", model: [subtaskInstance: subtaskInstance])
                return
            }
        }

        subtaskInstance.properties = params

        if (!subtaskInstance.save(flush: true)) {
            render(view: "edit", model: [subtaskInstance: subtaskInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'subtask.label', default: 'Subtask'), subtaskInstance.id])
        redirect(action: "show", id: subtaskInstance.id)
    }

    def delete(Long id) {
        def subtaskInstance = Subtask.get(id)
        if (!subtaskInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'subtask.label', default: 'Subtask'), id])
            redirect(action: "list")
            return
        }

        try {
            subtaskInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'subtask.label', default: 'Subtask'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'subtask.label', default: 'Subtask'), id])
            redirect(action: "show", id: id)
        }
    }
}
