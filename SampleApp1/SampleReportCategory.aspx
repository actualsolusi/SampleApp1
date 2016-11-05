﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="SampleReportCategory.aspx.vb" Inherits="SampleApp1.SampleReportCategory" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   //call printdiv() function on button click
<input name="b_print" type="button" onclick="printdiv();" value=" Print Report" />
//function for print
<script type="text/javascript">
    function printReport(report_ID) {
        var rv1 = $('#' + report_ID);
        var iDoc = rv1.parents('html');

        // Reading the report styles
        var styles = iDoc.find("head style[id$='ReportControl_styles']").html();
        if ((styles == undefined) || (styles == '')) {
            iDoc.find('head script').each(function () {
                var cnt = $(this).html();
                var p1 = cnt.indexOf('ReportStyles":"');
                if (p1 > 0) {
                    p1 += 15;
                    var p2 = cnt.indexOf('"', p1);
                    styles = cnt.substr(p1, p2 - p1);
                }
            });
        }
        if (styles == '') { alert("Cannot generate styles, Displaying without styles.."); }
        styles = '<style type="text/css">' + styles + "</style>";

        // Reading the report html
        var table = rv1.find("div[id$='_oReportDiv']");
        if (table == undefined) {
            alert("Report source not found.");
            return;
        }

        // Generating a copy of the report in a new window
        var docType = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/loose.dtd">';
        var docCnt = styles + table.parent().html();
        var docHead = '<head><title>Printing ...</title><style>body{margin:5;padding:0;}</style></head>';
        var winAttr = "location=yes, statusbar=no, directories=no, menubar=no, titlebar=no, toolbar=no, dependent=no, width=720, height=600, resizable=yes, screenX=200, screenY=200, personalbar=no, scrollbars=yes";;
        var newWin = window.open("", "_blank", winAttr);
        writeDoc = newWin.document;
        writeDoc.open();
        writeDoc.write(docType + '<html>' + docHead + '<body onload="window.print();">' + docCnt + '</body></html>');
        writeDoc.close();

        // The print event will fire as soon as the window loads
        newWin.focus();
        // uncomment to autoclose the preview window when printing is confirmed or canceled.
        // newWin.close();
    };

    $('#printreport').click(function () {
        printReport('rv1');
    });
</script>

    
    <rsweb:ReportViewer ID="ReportViewer1" Width="800" ShowPrintButton="true" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt">
       <LocalReport ReportPath="Report\ReportCategory.rdlc">
       </LocalReport>
    </rsweb:ReportViewer>
</asp:Content>

