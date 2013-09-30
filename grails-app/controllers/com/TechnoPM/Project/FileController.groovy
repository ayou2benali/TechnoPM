package com.TechnoPM.Project

import org.springframework.dao.DataIntegrityViolationException

class FileController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [fileInstanceList: File.list(params), fileInstanceTotal: File.count()]
    }

    def create() {
        [fileInstance: new File(params)]
    }

    def save() {
        def fileInstance = new File(params)
        if (!fileInstance.save(flush: true)) {
            render(view: "create", model: [fileInstance: fileInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'file.label', default: 'File'), fileInstance.id])
        redirect(action: "show", id: fileInstance.id)
    }

    def show(Long id) {
        def fileInstance = File.get(id)
        if (!fileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'file.label', default: 'File'), id])
            redirect(action: "list")
            return
        }

        [fileInstance: fileInstance]
    }

    def edit(Long id) {
        def fileInstance = File.get(id)
        if (!fileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'file.label', default: 'File'), id])
            redirect(action: "list")
            return
        }

        [fileInstance: fileInstance]
    }

    def update(Long id, Long version) {
        def fileInstance = File.get(id)
        if (!fileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'file.label', default: 'File'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (fileInstance.version > version) {
                fileInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                        [message(code: 'file.label', default: 'File')] as Object[],
                        "Another user has updated this File while you were editing")
                render(view: "edit", model: [fileInstance: fileInstance])
                return
            }
        }

        fileInstance.properties = params

        if (!fileInstance.save(flush: true)) {
            render(view: "edit", model: [fileInstance: fileInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'file.label', default: 'File'), fileInstance.id])
        redirect(action: "show", id: fileInstance.id)
    }

    def delete(Long id) {
        def fileInstance = File.get(id)
        if (!fileInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'file.label', default: 'File'), id])
            redirect(action: "list")
            return
        }

        try {
            fileInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'file.label', default: 'File'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'file.label', default: 'File'), id])
            redirect(action: "show", id: id)
        }
    }
}
