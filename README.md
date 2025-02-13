# Betalink - Resource Sharing Platform

Betalink is a resource-sharing platform designed for the Faculty of Computing at UTM. It allows lecturers to share resource links with students, while admins can manage categories and monitor resources. The platform improves resource sharing and management through a structured interface and role-based access control.

JSON Service: http://web.fc.utm.my/ttms/web_man_webservice_json.cgi

## Features
- **Admin**: Add/delete categories.
- **Lecturer**: share, edit, delete, and set visibility for resource links.
- **Student**: View, sort, and search resources.

## Technologies
- **Frontend**: Vue.js
- **Backend**: Node.js/Express.js
- **Database**: MySQL

## Files provided other than the Source Code
- **Design Update Document**: Outlines the system's architecture, requirements, and design.
- **End-User Documentation**: Provides step-by-step guides for users (admins, lecturers, students).
- **Sequence Diagram**: General Sequence Diagram made for all Users and UCs.
- **SQL Code**: Exported MySQL Database in SQL Commands.

## Instructions to run on local host
- **Install dependencies**: npm install
- **Run the backend**: node server.js
- **Run the frontend**: npm run dev
