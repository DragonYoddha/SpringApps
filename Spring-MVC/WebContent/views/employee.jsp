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
            recordHeight : 400,
            footer: true
        },
        columns: [
            { field: 'recid', caption: 'ID', size: '10%', sortable: true },
            { field: 'firstName', caption: 'First Name', size: '20%', sortable: true, resizable: true },
            { field: 'email', caption: 'Email', size: '30%', sortable: true, resizable: true },
            { field: 'hireDate', caption: 'Hire Date', size: '30%', sortable: true, resizable: true },
            { field: 'salary', caption: 'Salary', size: '10%', sortable: true, resizable: true }
        ],
        searches: [
            { field: 'recid', caption: 'ID', type: 'text' },
            { field: 'firstName', caption: 'First Name', type: 'text' },
            { field: 'email', caption: 'Email', type: 'text' },
            { field: 'hireDate', caption: 'Hire Date', type: 'date' },
            { field: 'salary', caption: 'Salary', type: 'text' },
            { field: 'email', caption: 'Email', type: 'list', options: { items: ['peter@gmail.com', 'jim@gmail.com', 'jdoe@gmail.com']} },
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
            /* console.log(event.searchData[0].field);
            console.log(event.searchData[0].operator);
            console.log(event.searchData[0].type);
            console.log(event.searchData[0].value); */
            
            for(var i=0;i<event.searchData.length;i++)
            	{
            		fields=event.searchData[i].field;
            		operator=event.searchData[i].operator;
            		type=event.searchData[i].type;
            		value=event.searchData[i].value;
            		temp=fields+"#"+operator+"#"+type+"#"+value;
            		arrayObj.push(temp);
            	}
            /* console.log(arrayObj);
            console.log(arrayObj.length); */
            event.preventDefault();
            $("#gridSearchFields").val(arrayObj);
            
            var data1 = $("#employeeForm").serialize();
            $.ajax({
    	        url: "http://localhost:8585/Spring-MVC/search",
    	        data: data1
    	    })
            //doSubmit("search");
        }
    });
    w2ui['grid'].reset();
});
</script>

</html>