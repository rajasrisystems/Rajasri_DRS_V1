{literal}
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript">
function validate_ad()
{
	
	var spl_char = /[\W_]/;
	if(document.getElementById('ad_fname').value == "")
	{
		
		document.getElementById('errmsg1').innerHTML = 'Please enter name';
		document.getElementById('ad_fname').focus();
		return false;
	}
	if(document.getElementById('ad_txt').value == "")
	{
		
		document.getElementById('errmsg1').innerHTML = 'Please enter username';
		document.getElementById('ad_txt').focus();
		return false;
	}
	if(document.getElementById('ad_pass').value =="")
	{
		document.getElementById('errmsg1').innerHTML = 'Please enter password';
		document.getElementById('ad_pass').focus();
		return false;
	}
	var pwd = document.getElementById('ad_pass').value;
	
	if(spl_char.test(pwd))
	{
		
		document.getElementById('errmsg1').innerHTML = 'Special characters not allowed';
		return false;
	}
	if(document.getElementById('AdminID').value=='')
	{
		document.getElementById("hdAction").value='1';
		return true;
	}else{
		document.getElementById("updateAction").value='1';
		return true;
	}
	
}
function myFunction() 
	{
		var x;
		if (confirm("Are you sure! you want to delete this record?")) 
		{
			return true;
		}
		else 
		{
			return false; 		
	   	}
	}
function sortsub1()
	{
	if((document.getElementById('sortflag').value!="1")&&(document.getElementById('sortflag').value!="2"))
	{
		flag=2;
	}else if(document.getElementById('sortflag').value=="1")
	{
		flag=2;
	}
	else if(document.getElementById('sortflag').value=="2")
	{
		flag=1;
	}	
	FormName = document.admin_form;
	FormName.sortflag.value=flag;
	FormName.submit();
	}
function sortsub2()
	{
	if((document.getElementById('sortflag').value!="3")&&(document.getElementById('sortflag').value!="4"))
	{
		flag=4;
	}else if(document.getElementById('sortflag').value=="3")
	{
		flag=4;
	}
	else if(document.getElementById('sortflag').value=="4")
	{
		flag=3;
	}
	FormName = document.admin_form;
	FormName.sortflag.value=flag;
	FormName.submit();
	}	
</script>
{/literal}
<div id="middle"> 
  <div id="center-column">
    <div class="top-bar-header">
		<h1><b>Admin</b></h1>
		<div class="breadcrumbs"><a href="controlpanel.php">Homepage</a> >>Admin</div>
	</div>
		<br/>
		<div class = "manage-grid">
			<div class="report-page" style="text-align:left;">
			<form action="" name="rptpage" method="post" onsubmit="return validate_ad()">
						<input type="hidden" id="hdAction" name="hdAction" value="">
						<input type="hidden" id="AdminID" name="AdminID" value="{$smarty.request.Ad_Id}">
						<input type="hidden" id="updateAction" name="updateAction" value="">
						<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
							<th colspan="9" style="text-align:left">Admin</th>
				<tr>
				<td style="border-bottom:none;" colspan="8">
					<div class="Error" align="center" id="errmsg1"></div>
					<div class="Error" align="center" id="errmsg1">{$ErrorMessage}</div>
					<div class="success" align="center" id="errmsg">{if $smarty.request.successmsg eq 2}Admin details deleted successfully {else}{$SuccessMessage} {/if}</div>
					
				</td>
				</tr>
			<tr style="border-bottom:none;">
				
				<td width="10%" nowrap="nowrap" style="text-align:right;">Name:</td>
				<td width="5%"><input type ="text" id="ad_fname" name = "admin_fname" value="{$adminDetails.0.Name}"></td>
				
				<td width="10%" nowrap="nowrap" style="text-align:right;">Username:</td>
				<td width="5%"><input type ="text" id="ad_txt" name = "admin_text" value="{$adminDetails.0.Username}"></td>
				
				
				
				<td width="10%" nowrap="nowrap" style="text-align:right;">Password:</td>
				<td width="5%"><input type ="password" id="ad_pass" name = "admin_password" value="{$adminDetails.0.Password}" ></td>
				<td width="10%" nowrap="nowrap" style="text-align:right;"></td>
				<td width="5%"><input type ="submit" id="rs_btn" name = "admin_button" value="Submit" ></td>

               
	        </tr>
	        </table>
		</form>
		<div id = "res_tbl" >	
		<form name="admin_form" id="admin_form" method="post" >
		<input type="hidden" name="sortflag" id="sortflag" value="{$smarty.request.sortflag}">
			<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
				<!--- <th colspan="6" style="text-align:left"> Admin Username List </th> -->
				<tr>&nbsp;</tr>
					<th width="8%"><span style="cursor: pointer; text-decoration: underline;" onclick="sortsub1();">Name</span></th>
					<th width="8%"><span style="cursor: pointer; text-decoration: underline;" onclick="sortsub2();">Username</span></th>
					<th width="8%">Action</th>
				</tr>
					{section name=R loop=$showval}
				<tr>
					<td  style="text-align:left">{$showval[R].Name}</td>
					<td>{$showval[R].Username|upper}</td>
					<td style="padding:8px"><a href="#">
						<a href="admin.php?Ad_Id={$showval[R].ID}"> <img src="img/b_edit.png"></a>&nbsp;&nbsp;
							<a href="ad_drop.php?Del_Id={$showval[R].ID}"><img src="img/b_drop.png" onclick="return myFunction();" ></a>
							<!-- <input type="hidden" name="delvar" id="delvar" value="{$displaydet[i].RatingID}"> -->
							</td>
							</tr>
						{sectionelse}
						<tr>
							<td colspan="3">No Records Found</td>
						</tr>
						{/section}
				</table>
				</div>
			 
	      </div>	  
	</div>
</div>

