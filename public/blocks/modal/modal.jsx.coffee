# @cjsx React.DOM
React = require 'react'

module.exports = ->
  <div className="modal fade">
    <div className="modal-dialog">
      <div className="modal-content">
        <div className="modal-body">
          {@props.content}
        </div>
        <div className="modal-footer">
          
          
          <button type="button" className="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

# <div className="modal-header">
#   <button type="button" className="close" data-dismiss="modal">
#     <span className="sr-only">Close</span>
#   </button>
#   <h4 className="modal-title">Modal title</h4>
# </div>

# https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20140810T175233Z.9be150453f3c3381.b2fc818fcafb8467b2d237d744afdae7377c6106&text=apple&lang=en-uk
# https://dictionary.yandex.net/api/v1/dicservice.json/lookup?key=dict.1.1.20140810T180842Z.4c05fa23929d891b.09cd3952d48696c639b164a771f694567b04bdef&lang=en-ru&text=time

# <button type="button" className="modal__prev btn btn-default"><i className="fa fa-arrow-left"></i></button>
# <button type="button" className="modal__next btn btn-default"><i className="fa fa-arrow-right"></i></button>