# ChatGPT Clone

A full-stack ChatGPT clone built with the MERN stack (MongoDB, Express.js, React, Node.js) using OpenAI's GPT-3.5 Turbo API.

## Features

- 🔐 **Authentication**: Email/password login with email verification
- 🔑 **Google OAuth**: Sign in with Google
- 💬 **Real-time Chat**: AI-powered conversations using GPT-3.5 Turbo
- 💾 **Auto-save**: Chats automatically saved to MongoDB
- 📜 **Chat History**: Access your previous conversations
- 🌙 **Dark/Light Mode**: Theme toggle with persistence
- 📱 **Responsive Design**: Works on desktop and mobile
- 🔌 **PWA Support**: Install as a progressive web app
- 🔒 **Forgot Password**: Email-based password reset

## Tech Stack

**Frontend:**
- React 18 + Vite
- Redux Toolkit
- React Router v6
- SCSS
- Google OAuth

**Backend:**
- Node.js + Express
- MongoDB
- JWT Authentication
- OpenAI API (GPT-3.5 Turbo)
- Nodemailer

## Prerequisites

Before you begin, ensure you have:

- [Node.js](https://nodejs.org/) (v18 or higher)
- [MongoDB](https://www.mongodb.com/) (local or Atlas)
- [OpenAI API Key](https://platform.openai.com/api-keys)
- [Google OAuth Client ID](https://console.cloud.google.com/apis/credentials)
- Gmail account for SMTP (or other email provider)

## Environment Variables

### Server (`server/.env`)

```env
PORT=5000
NODE_ENV=development
MONGO_URL=mongodb+srv://username:password@cluster.mongodb.net/chatGPT
SITE_URL=http://localhost:5173
JWT_PRIVATE_KEY=your-super-secret-jwt-key
OPENAI_API_KEY=sk-xxxxxxxxxxxxxxxxxxxxx
OPENAI_ORGANIZATION=org-xxxxxxxxxxxxx
MAIL_EMAIL=your-email@gmail.com
MAIL_SECRET=your-app-password
```

### Client (`client/.env.local`)

```env
VITE_CLIENT_ID=your-google-client-id.apps.googleusercontent.com
```

## Local Development

### 1. Clone the repository

```bash
git clone https://github.com/ansonbenny/ChatGPT.git
cd ChatGPT
```

### 2. Setup the Server

```bash
cd server
npm install
# Create .env file with your variables
npm run dev
```

### 3. Setup the Client

```bash
cd client
npm install
# Create .env.local file with your Google Client ID
npm run dev
```

The app will be available at `http://localhost:5173`

---

## 🚀 Deploy to Render.com

### Option 1: One-Click Deploy (Recommended)

1. Fork this repository to your GitHub account

2. Go to [Render Dashboard](https://dashboard.render.com)

3. Click **New → Web Service**

4. Connect your GitHub repository

5. Configure the service:
   - **Name**: `chatgpt-clone` (or your preferred name)
   - **Region**: Choose closest to your users
   - **Root Directory**: Leave empty
   - **Build Command**: 
     ```
     cd client && npm install && npm run build && mkdir -p ../server/dist && cp -r dist/* ../server/dist/ && cd ../server && npm install --omit=dev
     ```
   - **Start Command**: `cd server && npm start`

6. Add Environment Variables:
   | Key | Value |
   |-----|-------|
   | `NODE_ENV` | `production` |
   | `PORT` | `5000` |
   | `MONGO_URL` | Your MongoDB connection string |
   | `SITE_URL` | `https://your-app-name.onrender.com` |
   | `JWT_PRIVATE_KEY` | Generate a secure random string |
   | `OPENAI_API_KEY` | Your OpenAI API key |
   | `OPENAI_ORGANIZATION` | Your OpenAI organization ID |
   | `MAIL_EMAIL` | Your Gmail address |
   | `MAIL_SECRET` | Your Gmail app password |
   | `VITE_CLIENT_ID` | Your Google OAuth Client ID |

7. Click **Create Web Service**

### Option 2: Using render.yaml

The repository includes a `render.yaml` file for Infrastructure as Code deployment:

1. Fork this repository
2. Go to Render Dashboard → **New → Blueprint**
3. Connect your repository
4. Render will automatically detect `render.yaml`
5. Fill in the environment variables when prompted
6. Deploy!

### Post-Deployment Configuration

#### Google OAuth Setup

1. Go to [Google Cloud Console](https://console.cloud.google.com/apis/credentials)
2. Select your OAuth 2.0 Client ID
3. Add your Render URL to **Authorized JavaScript origins**:
   - `https://your-app-name.onrender.com`
4. Add to **Authorized redirect URIs**:
   - `https://your-app-name.onrender.com`
   - `https://your-app-name.onrender.com/login/auth`

#### Gmail App Password

1. Enable 2-Step Verification on your Google Account
2. Go to [App Passwords](https://myaccount.google.com/apppasswords)
3. Generate a new app password for "Mail"
4. Use this password as `MAIL_SECRET`

---

## API Endpoints

### Authentication
| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/user/checkLogged` | Check login status |
| POST | `/api/user/signup` | Register new user |
| GET | `/api/user/login` | Login user |
| GET | `/api/user/logout` | Logout user |
| POST | `/api/user/forgot-request` | Request password reset |
| PUT | `/api/user/forgot-finish` | Complete password reset |
| DELETE | `/api/user/account` | Delete account |

### Chat
| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/api/chat/` | Create new chat |
| PUT | `/api/chat/` | Continue existing chat |
| GET | `/api/chat/saved` | Get chat by ID |
| GET | `/api/chat/history` | Get chat history |
| DELETE | `/api/chat/all` | Delete all chats |

---

## Screenshots

![Chat Interface](https://user-images.githubusercontent.com/94070164/236693044-a4884b84-a058-46ba-ae50-0f9b50f92f02.png)

![Login Page](https://user-images.githubusercontent.com/94070164/236693346-08e08ae2-c265-4743-b9f6-e4899c4168bb.png)

![Dark Mode](https://user-images.githubusercontent.com/94070164/236693084-8e6df9e7-9e12-427d-a63f-1123145e50f8.png)

---

## Troubleshooting

### Common Issues

**1. "OpenAI API Error"**
- Verify your `OPENAI_API_KEY` is valid
- Check if you have API credits remaining
- Ensure `OPENAI_ORGANIZATION` is correct

**2. "CORS Error"**
- Make sure `SITE_URL` exactly matches your frontend URL
- Include the protocol (`https://`)

**3. "Google Login Not Working"**
- Verify `VITE_CLIENT_ID` is set correctly
- Check authorized origins in Google Console
- Ensure the app is using HTTPS in production

**4. "Emails Not Sending"**
- Use a Gmail App Password, not your regular password
- Enable 2FA on your Google account first

---

## License

ISC License

## Author

**Anson Benny**

---

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request
