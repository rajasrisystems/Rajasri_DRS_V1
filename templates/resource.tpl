{literal}
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
<script type="text/javascript">
function validate_rs()
{
	var spl_char = /[\W_]/;
	if(document.getElementById('rs_txt').value == "")
	{
		
		document.getElementById('errmsg1').innerHTML = 'Please enter resource name';
		document.getElementById('rs_txt').focus();
		return false;
	}
	if(document.getElementById('rs_ini').value =="")
	{
		document.getElementById('errmsg1').innerHTML = 'Please enter resource initial';
		document.getElementById('rs_ini').focus();
		return false;
	}
	
	var rsin = document.getElementById('rs_ini').value;
	if(spl_char.test(rsin))
	{
		
		document.getElementById('errmsg1').innerHTML = 'Special characters not allowed';
		return false;
	}
	
	if(document.getElementById('ResID').value=='')
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
		if (confirm("Are you sure! you want to delete this record?") ) 
		{
			return true;
		}
		else 
		{
			return false; 		
	   	}
	}
function sortfunction()
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
	FormName = document.res_sort;
	FormName.sortflag.value=flag;
	FormName.submit();
	}
function ressortsub2()
{
	if((document.getElementById('sortflag').value!="3")&&(document.getElementById('sortflag').value!="4")){
		flag=3;
	}else if(document.getElementById('sortflag').value=="3")
	{
		flag=4;
	}
	else if(document.getElementById('sortflag').value=="4"){
		flag=3;
	}	
	FormName = document.res_sort;
	FormName.sortflag.value=flag;
	FormName.submit();
}
</script>
{/literal}
<div id="middle"> 
  <div id="center-column">
    <div class="top-bar-header">
		<h1>Resource</h1>
		<div class="breadcrumbs"><a href="controlpanel.php" >Homepage</a> >> Resource</div>
		</div>
		<br/>
		<div class = "manage-grid">
		
		
			<div class="report-page" style="text-align:left;">
				<form action="" name="rptpage" method="post" onsubmit ="return validate_rs();">
				<input type="hidden" id="hdAction" name="hdAction" value=""> 
				
				<input type="hidden" id="ResID" name="ResID" value="{$smarty.request.Rs_Id}">   <!--- used for taking the temp value/data which is not going to store in db
																										/show to user-this will store and display-->
				<input type="hidden" id="updateAction" name="updateAction" value="">
				
				<table border="0" cellpadding="0" cellspacing="0" class="grid-table">
				<th colspan="9" style="text-align:left">Resource</th>
				<tr>
				<td style="border-bottom:none;" colspan="8">
					<div class="Error" align="center" id="errmsg1"></div>
					<div class="Error" align="center" id="errmsg1">{$ErrorMessage}</div>
					<div class="success" align="center" id="errmsg">{$SuccessMessage}</div>
					<div class="success">{if $smarty.request.successmsg eq 1}Resource details updated successfully {/if}</div>
					<div class="success">{if $smarty.request.successmsg eq 2}Resource details deleted successfully {/if}
				</td>
				</tr>
			<tr style="border-bottom:none;">
				
				 
				<!---- Resource Name Text Box ---->
				<td width="10%" nowrap="nowrap" style="text-align:right;">Resource Name:</td>
				<td width="5%"><input type ="text" id="rs_txt" name = "resource_text" value="{$resourceDetails.0.ResourceName}"></td>
				
				<!---- Resource Initial Text ---->
				
				<td width="10%" nowrap="nowrap" style="text-align:right;">Resource Initial:</td>
				<td width="5%"><input type ="text" id="rs_ini" name = "resource_initial" value="{$resourceDetails.0.ResourceInitial}" onkeyup ="caps()" ></td>
				
				<!---- Submit Button ---->
				
				<td width="10%" nowrap="nowrap" style="text-align:right;"></td>
				<td width="5%"><input type ="submit" id="rs_btn" name = "resource_button" value="Submit" onsubmit="validate_rs()"></td>
	        </tr>
	        </table>
		</form>
		<div id = "res_tbl" >	
		<form name="res_sort" id="res_sort" method="post">
		<input type="hidden" name="sortflag" id="sortflag" value="{$smarty.request.sortflag}">
			<table border="0" cellpadding="2" cellspacing="0" class="grid-table">
				<tr>&nbsp;</tr>
					<th width="8%">
					<span style="cursor: pointer; text-decoration: underline;" onclick="sortfunction();">Resource Name
					</span>
					</th>
					<th width="8%">
					<span style="cursor: pointer; text-decoration: underline;" onclick="ressortsub2();">Resource Initial
					</span>	
					</th>
					<th width="8%">Action</th>
				</tr>
				{assign var=number value=1}
				{section name=R loop=$showres}
				<tr>
					<td align="left">{$showres[R].ResourceName|ucfirst}</td>
					<td>{$showres[R].ResourceInitial|upper}</td>
					<td style="padding:8px"><a href="#">
						<a href="resource.php?Rs_Id={$showres[R].ID}"> <img src="img/b_edit.png"></a>&nbsp;&nbsp;
						<a href="rs_drop.php?Del_Id={$showres[R].ID}"><img src="img/b_drop.png" onclick="return myFunction();" ></a>
					</td>
				</tr>
				{sectionelse}
				<tr>
					<td colspan="3">No Records Found</td>
				</tr>
				{/section}
			</table>
			</form>
		</div>
		
	      </div>	  
	</div>
</div>

