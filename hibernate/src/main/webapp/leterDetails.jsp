<jsp:useBean id="envelopeSize" class="com.isa.jjdd2.postman.view.Envelope"/>

<div class="modal-dialog" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="newLetterLabel">New Letter</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <form action="addLetter" method="post">
            <div class="modal-body">
                <div class="container">
                    <div class="form-group row">
                        <div class="input-group">
                            <span class="input-group-addon">From</span>
                            <input type="text" name="sender" class="form-control input-lg"
                                   placeholder="name, surname, street, house, flat, city">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="input-group">
                            <span class="input-group-addon">To</span>
                            <input type="text" name="receiver" class="form-control input-lg"
                                   placeholder="name, surname, street, house, flat, city">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="input-group">
                            <span class="input-group-addon">Size</span>
                            <select class="form-control" name="envelopSize">
                                <c:forEach var="size" items="${envelopeSize.values}">
                                    <option>${size}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <input type="submit" class="btn btn-primary" value="Save letter">
            </div>
        </form>
    </div>
</div>

