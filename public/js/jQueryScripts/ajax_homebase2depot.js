/*
async � ������������� �������, �� ��������� true
cache � ���/���� ����������� ������ ���������, �� ��������� true
contentType � �� ��������� �application/x-www-form-urlencoded�
data � ������������ ������ � ������ ��� ������
dataFilter � ������ ��� ������� ������
dataType � ��� ������ ������������ � callback ������� (xml, html, script, json, text, _default)
global � ������ � �������� �� ������������� ���������� AJAX Event'��, �� ��������� true
ifModified � ������ � ��������� ���� �� ��������� � ������ �������, ���� �� ����� ��� ������, �� ��������� false
jsonp � �������������� ��� callback ������� ��� ������ � JSONP (�� ��������� ������������ �� ����)
processData � �� ��������� ������������ ������ �������������� � ������, � ������������ ��� �application/x-www-form-urlencoded�, ���� ���� ����� � ���������
scriptCharset � ����������� � ��������� ��� JSONP � ��������� JavaScript'��
timeout � ����� ������� � �������������
type � GET ���� POST
url � url ������������� ��������
 */
 function addClickHandlers(Homebase_id) {
  // $(".d_homebase_ID_item").click(function() {
        $.get("/ajax/homebase/get-Depot-List/",{id:Homebase_id}, function(data){
            $('#d_depot_ID option').remove();
            $('#d_depot_ID').append(""+data+"");
        })
  // })
 }
 
/*
 function addClickHandlers() {
   $("#d_depot_ID", this).click(function() {
     $.ajax("/ajax/homebase/get-Depot-List/",{id:$('select#d_homebase_ID option')}, function(data){
           alert("s\sdsad");
        $('#d_depot_ID').remove();
        $('#d_depot_ID').append(""+data+"");
       })
   });
 }*/
// $(document).ready(addClickHandlers);
