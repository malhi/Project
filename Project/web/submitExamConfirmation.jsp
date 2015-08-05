<%-- 
    Document   : submitExamConfirmation
    Created on : 4-Aug-2015, 6:55:34 PM
    Author     : c0653616
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Finish Examination</title>
    </head>
    <body>
        
        <form name="submitExam" id="submitExamNow" action="submitExamination" method="POST">
        <table border="0" cellpadding="10" style="position: absolute; top: 40%; left: 40%">
            <tr>
                <td colspan="2">Are you sure you wish to finish the exam?</td>
            </tr>
            <tr>
                <td align ="center">
                    <a href="javascript:void(0)" onclick="javascript:document.getElementById('submitExamNow').submit()">
                        Submit Exam
                    </a>
                </td>
                <td align ="center">
                    <a href ="Examination.jsp">
                        Back
                    </a>
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
