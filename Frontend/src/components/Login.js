import axios from "axios";
import React, { Fragment, useState } from "react";
import { useNavigate } from "react-router-dom";

function Login( {setIsLoggedIn }) {
    const [Email, setEmail] = useState('');
    const [Password, setPassword] = useState('');
    const [emailError, setEmailError] = useState('');
    const [passwordError, setPasswordError] = useState('');
    const navigate = useNavigate();

    const handleEmailChange = (value) => {
        setEmail(value);
        // Email validation using regex
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(value)) {
            setEmailError('Invalid email format');
        } else {
            setEmailError('');
        }
    }

    const handlePasswordChange = (value) => {
        setPassword(value);
        // Password validation using regex
        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
        if (!passwordRegex.test(value)) {
            setPasswordError('Password must contain at least 8 characters, including uppercase, lowercase, numbers, and special characters');
        } else {
            setPasswordError('');
        }
    }

    const handleLogin = async () => {
        if (emailError || passwordError) {
            alert('Please fix the errors in the form');
            return;
        }
        if (!Email || !Password) {
        alert('Email and password are required');
        return;
    }

        const data = {
            email: Email,
            password: Password
        };

        const url = "http://localhost:17661/api/Signup/Login";

        try {
            const result = await axios.post(url, data);
            if (result.data === "Valid User") {
              setIsLoggedIn(true);
                navigate(`/Dashboard`);
            } else {
                alert("Invalid User");
            }
        } catch (error) {
            console.error("Error:", error);
            alert("An error occurred. Check the console for details.");
        }
    }

    return (
        <Fragment>
            <div className="login-container">
                <form className="registration-form">
                    <div className="registration-header">Login</div>
                    <div className="form-input-container required-field">
                        <input
                            type="email"
                            id="email"
                            placeholder="Email"
                            className="form-input"
                            onChange={(e) => handleEmailChange(e.target.value)}
                            required
                        />
                        {emailError && <div className="error-message">{emailError}</div>}
                    </div>
                    <div className="form-input-container required-field">
                        <input
                            type="password"
                            id="Pass"
                            placeholder="Password"
                            className="form-input"
                            onChange={(e) => handlePasswordChange(e.target.value)}
                            required
                        />
                        {passwordError && <div className="error-message">{passwordError}</div>}
                    </div>
                    <button type="button" className="form-button" onClick={handleLogin}>Login</button>
                </form>
            </div>
        </Fragment>
    )
}

export default Login;
