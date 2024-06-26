import React, { Fragment, useState } from 'react';
import axios from 'axios';

export default function Signup() {
    const [userid, setUserid] = useState('');
    const [username, setUsername] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [user_type_id, setUser_type_id] = useState('');
    const [error, setError] = useState('');

    const handleInputChange = (setter, validator) => (event) => {
        let value = event.target.value;
        if (setter === setUserid) {
          // Filter out non-alphabet characters
          value = value.replace(/[^a-zA-Z]/g, '');
        }
        setter(value);
        if (validator) {
          validator(value);
        }
      };

    const validateEmail = (email) => {
        const re = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return re.test(email);
    };

    const validatePassword = (password) => {
        // At least 8 characters, 1 uppercase, 1 lowercase, 1 number
        const re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
        return re.test(password);
    };

    const handleSignup = () => {
        setError('');
        if (!userid || !username || !email || !password || !user_type_id) {
            setError("All fields are required.");
            return;
        }
        if (!validateEmail(email)) {
            setError("Please enter a valid email address.");
            return;
        }

        if (!validatePassword(password)) {
            setError("Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number.");
            return;
        }

        const data = {
            userid,
            username,
            email,
            password,
            user_type_id
        };

        const url = 'http://localhost:17661/api/Signup/Signup';
        axios.post(url, data)
            .then((result) => {
                if (result.data === "User already exists") {
                    setError("A user with this email already exists. Please use a different email.");
                } else {
                    alert("Signup successful!");
                    // Clear the form fields after successful signup
                    setUserid('');
                    setUsername('');
                    setEmail('');
                    setPassword('');
                    setUser_type_id('');
                }
            })
            .catch((error) => {
                setError(error.message || "An error occurred during signup.");
            });
    };

    return (
        <Fragment>
           <div className="signup-container">
            <form className="signup-form">
                <h2>Sign Up</h2>
                {error && <div className="error-message">{error}</div>}
                <div className="form-group">
                    <label htmlFor="numId">User ID</label>
                    <input type="text" id="numId" value={userid} placeholder="Enter user ID" onChange={handleInputChange(setUserid)} />
                </div>
                <div className="form-group">
                    <label htmlFor="txtname">Username</label>
                    <input type="text" id="txtname" value={username} placeholder="Enter username" onChange={handleInputChange(setUsername)} />
                </div>
                <div className="form-group">
                    <label htmlFor="email">Email</label>
                    <input type="email" id="email" value={email} placeholder="Enter email" onChange={handleInputChange(setEmail)} />
                </div>
                <div className="form-group">
                    <label htmlFor="numpwd">Password</label>
                    <input type="password" id="numpwd" value={password} placeholder="Enter password" onChange={handleInputChange(setPassword)} />
                    {/* <small>8+ characters with 1 uppercase, 1 lowercase, 1 number</small> */}
                </div>
                <div className="form-group">
                    <label htmlFor="user-select">User Type</label>
                    <select id="user-select" value={user_type_id} onChange={handleInputChange(setUser_type_id)}>
                        <option value="">Select user type</option>
                        <option value="super_admin">Super Admin</option>
                        <option value="admin">Admin</option>
                        <option value="owner">Owner</option>
                        <option value="manager">Manager</option>
                    </select>
                </div>
                <button type="button" onClick={handleSignup} className="submit-btn">Sign Up</button>
            </form>
        </div>
        </Fragment>
    );
}