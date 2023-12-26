
function submitform()
{
    regex_fullname();
    regex_email();
    regex_password();
    submit();
}

let fullname_error;
let emailID_error;
let password_error;


// Conditions:

// Min 1 uppercase letter.
// Min 1 lowercase letter.
// Min 1 special character.
// Min 1 number.
// Min 8 characters.
// Max 30 characters.;

function regex_fullname() {
    let fullname = document.getElementById("fullname").value;
    let fullname_r = /^[a-zA-Z]+(?:\s[a-zA-Z]+)*$/;
    ;
  
    if (fullname === null || fullname === undefined || fullname.trim() === "") {
        fullname_error = "Fill Full Name";
    } 
    else if (!fullname_r.test(fullname)) {
        fullname_error = "Enter valid Full Name";
    }
  
    if (fullname_error) {
      document.getElementById("fullname-error").innerHTML = fullname_error;
    }
  }

  function  regex_email()
  {
      let emailID =document.getElementById("email").value;
      let emailId_r = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  
      if ( emailID === null ||  emailID === undefined ||  emailID.trim() === "") {
          emailID_error = "Fill Email ID";
        } 
        else if (! emailId_r.test(emailID)) {
          emailID_error = "Enter valid Email ID ";
        }
      
        if (emailID_error)
         {
          document.getElementById("emailID-error").innerHTML = emailID_error;
  
  }
  }

  function  regex_password()
  {
    let password = document.getElementById("password").value;
    let password_r =   /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$@!%&*?])[A-Za-z\d#$@!%&*?]{8,30}$/;
    if (password  === null ||  password === undefined ||  password.trim() === "") {
        password_error = "Fill Password";
      } 
      else if (! password_r.test(password)) {
        password_error = "Enter valid Email ID  ";
      }
    
      if ( password_error)
       {
        document.getElementById("password-error").innerHTML =  password_error;
      

       }
  }

  function submit()
  {
 
  if(emailID_error == undefined && fullname_error == undefined && password_error == undefined)
  {
    document.getElementById("success").innerHTML = "Registration Sucessfull";
    document.getElementById("login").style.display = "block";
  }
  }
