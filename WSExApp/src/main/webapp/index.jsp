<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.5/handlebars.min.js"></script>
<link type="text/css" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"/>
<script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<!-- alpaca -->
<link type="text/css" href="//code.cloudcms.com/alpaca/1.5.22/bootstrap/alpaca.min.css" rel="stylesheet"/>
<script type="text/javascript" src="//code.cloudcms.com/alpaca/1.5.22/bootstrap/alpaca.min.js"></script>
<title>JSP Page</title>

</head>
<body>
	<h1>Hello Ashish1!</h1>
	  <div id="form"></div>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#form").alpaca({
                    "data": {
                        "name": "Cricket",
                        "details": "This event will be held on *date* and *timings*.",
                        "ranking": "excellent"
                    },
                    "schema": {
                        "title":"Event Management System",
                        "description":"Please Enter details for this event",
                        "type":"object",
                        "properties": {
                            "name": {
                                "type":"string",
                                "title":"Name",
                                "required":true
                            },
                            "details": {
                                "type":"string",
                                "title":"Details"
                            },
                            "participants": {
                                "type":"string",
                                "title":"Participants",
                                "enum":['excellent','ok','so so'],
                                "required":true
                            }
                        }
                    },
                    "options": {
                        "form":{
                            "attributes":{
                                "action":"http://httpbin.org/post",
                                "method":"post"
                            },
                            "buttons":{
                                "submit":{
                                    "title": "Send Form Data",
                                    "click": function() {
                                        var val = this.getValue();
                                        if (this.isValid(true)) {
                                            alert("Valid value: " + JSON.stringify(val, null, "  "));
                                            this.ajaxSubmit().done(function() {
                                                alert("Posted!");
                                            });
                                        } else {
                                            alert("Invalid value: " + JSON.stringify(val, null, "  "));
                                        }
                                    }
                                }
                            }
                        },
                        "helper": "Details for this event",
                        "fields": {
                            "name": {
                                "size": 20,
                                "helper": "Please enter event name."
                            },
                            "details" : {
                                "type": "textarea",
                                "name": "your_details",
                                "rows": 2,
                                "cols": 40,
                                "helper": "Please enter details for this event."
                            },
                            "participants": {
                            	"label": "select participants",
                                "type": "checkbox",
                                "multiple": true,
                                "dataSource": "/WSExApp/data/participants-list.json"
                            }
                        }
                    },
                    "postRender": function(control) {
                        control.childrenByPropertyId["name"].getFieldEl().css("background-color", "lightgreen");
                    }
                });
            });
        </script>
    </body>