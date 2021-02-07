<jsp:include page="WEB-INF/CommenLayouts/Header.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/NavBar.jsp"></jsp:include>
<jsp:include page="WEB-INF/CommenLayouts/SlideDrower.jsp"></jsp:include>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.DonationDAO"%>
<%@page import="Domain.Donation"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>

               

<div class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header card-header-primary">
                  <h4 class="card-title ">Donators </h4>
                  
                  
                  <div id="myModal" class="modal">

					  <!-- Modal content -->
					  
					
					</div>
                </div>
                <div class="card-body">
                  <div class="table-responsive">
                    <table class="table">
                      <thead class=" text-primary">
                        <th>
                          ID
                        </th>
                        <th>
                          Donation Id
                        </th>
                        <th>
                          Donator
                        </th>
                        
                        <th>
                          Location
                        </th>
                         
                        <th>
                         Date and Time
                        </th>
                        <th>
                          Status
                        </th>
                        <th>
                          Blood Group
                        </th>
                        <th>
                          Collector
                        </th>
                        <th>
                          
                        </th>
                      </thead>
                      <tbody>
                      
                     
							
							<%
							
							SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
								try{
								ResultSet resultSet = null;
								DonationDAO dao=new DonationDAO();
								resultSet =dao.getDonatorHistory();
								  
								String donerDate=null;
								 //System.out.println(resultSet.getInt("id"));
								while(resultSet.next()){
									if(resultSet.getString("timeStamp") == null){
										   donerDate = "";
										}else donerDate = (sdf.format(sdf.parse(resultSet.getString("timeStamp"))));
								%>
								<tr>
								<td><%=resultSet.getInt("id") %></td>
								<td><%=resultSet.getString("donationId") %></td>
								<td><%=resultSet.getString("name") %>(<%=resultSet.getString("nic") %>)</td>
								<td><%=resultSet.getString("location") %></td>
								<td><%=donerDate %></td>
								<td><%=resultSet.getString("status") %></td>
								<td><%=resultSet.getString("bloodGroup") %></td>
								<td><%=resultSet.getString("collector") %></td>
								
								</tr>
								<%
								}
								
								} catch (Exception e) {
								e.printStackTrace();
								}
								%>
                      
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>



<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>


<jsp:include page="WEB-INF/CommenLayouts/Footer.jsp"></jsp:include>
    