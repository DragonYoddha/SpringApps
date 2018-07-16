<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>
<html>
<head>
<title>Clinical Personnel</title>
<meta charset="UTF-8">
 	<link rel="stylesheet" href="resources/jquery-ui.min.css"> 
 	<link rel="stylesheet" href="resources/w2ui-1.5.rc1.min.css"> 
 	<link rel="shortcut icon" type="image/x-icon" href= "resources/ssheader-right.ico"/>
   	<script src="resources/jquery-3.3.1.min.js"></script>
  	<script src="resources/jquery-ui.min.js"></script> 
  	<script src="resources/w2ui-1.5.rc1.min.js"></script> 
</head>
<script type="text/javascript">

function doSubmit(action)
{
	if(action=='search')
	{
		var form = $("#employeeForm").serialize();
	    $.ajax({
	        url: "http://192.168.121.1:8585/Spring-MVC/searchClinicalPersonnel",
	        dataType: 'json',
	        data: form
	    })
	    .done (function(data) {

	    	w2ui['grid'].clear();
			 w2ui['grid'].add(data);
	    	})
	}
	else if(action=='load')
	{
		var form = $("#employeeForm").serialize();
	    $.ajax({
	        url: "http://192.168.27.1:8585/Spring-MVC/loadAllEmployees",
	        dataType: 'json',
	        data: form
	    })
	    .done (function(data) {console.log(data);

	    	w2ui['grid'].clear();
			 w2ui['grid'].add(data);
	    	})
	}
}

</script>
<body>

	<form:form modelAttribute="employeeForm">
 		<div id="grid" style="width: 100%; height: 700px;"></div>
 		<form:hidden path="gridSearchFields"/>
 		<div id="theDiv"></div>
	</form:form>

</body>
  
  <script>
  var employee =${employeeList}
console.log(employee);
$(function () {
    $('#grid').w2grid({
    	name: 'grid',
        header: 'List of Names',
        show: {
        	toolbar: true,
			toolbarReload : false,
            recordHeight : 400,
            footer: true,
            toolbarColumns:false,
            toolbarInput:false
        },
        multiSelect:false,
        multiSort : false,
        toolbar: {
            items: [
                { type: 'break' },
                { type: 'button', id: 'load', caption: 'Load'},
                { type: 'break' },
                { type: 'button', id: 'clear', caption: 'Clear'}
            ],
            onClick: function (target, data) {
            	if(target=='load')
            	{
            		doSubmit("load");
            	} 
            	else if(target=='clear')
        		{
            		w2ui['grid'].clear();
            		$("#gridSearchFields").val("");
        		}
            }
        },
        columns: [
            /* { field: 'recid', caption: 'ID', size: '10%', sortable: true }, */
            { field: 'firstName', caption: '<b>Name</b>', size: '20%', sortable: true, resizable: true },
            { field: 'email', caption: '<b>Email</b>', size: '30%', sortable: true, resizable: true },
            { field: 'hireDate', caption: '<b>Hire Date</b>', size: '30%', sortable: true, resizable: true },
            { field: 'salary', caption: '<b>Salary</b>', size: '10%', sortable: true, resizable: true }
        ],
        searches: [
            /* { field: 'recid', caption: 'ID', type: 'text' }, */
            { field: 'firstName', caption: 'First Name', type: 'text' },
            { field: 'email', caption: 'Email', type: 'text' },
            { field: 'hireDate', caption: 'Hire Date', type: 'date' },
            { field: 'salary', caption: 'Salary', type: 'text' },
           /*  { field: 'email', caption: 'Email', type: 'list', options: { items: ['peter@gmail.com', 'jim@gmail.com', 'jdoe@gmail.com']} }, */
        ], 
        sortData: [{ field: 'recid', direction: 'ASC' }],
        records: employee,
        onSearch: function(event) {
        	var arrayObj = [];
        	var temp;
        	var fields;
        	var operator;
        	var type;
        	var value;
            
            for(var i=0;i<event.searchData.length;i++)
            	{
            		fields = event.searchData[i].field;
            		operator = event.searchData[i].operator;
            		type = event.searchData[i].type;
            		value = event.searchData[i].value;
            		temp = fields+"#"+operator+"#"+type+"#"+value;
            		
            		/* if operator type is between replace , with & */
            		temp = temp.replace(/,([^,]*)$/,'&'+'$1');
            		
            		arrayObj.push(temp);
            	}
            event.preventDefault();
            $("#gridSearchFields").val(arrayObj);
           
            doSubmit("search");
        }
    });
    w2ui['grid'].reset();
});
</script>

</html>