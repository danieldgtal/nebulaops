# nebulaops
# 🌌 NebulaOps — Hybrid Compute Platform (PoC)

**NebulaOps** is a proof-of-concept hybrid compute platform inspired by enterprise-scale environments (like RBC Compute Platform).  
It combines **Infrastructure as Code (IaC)**, **Temporal orchestration**, **DevOps best practices**, and **AI-driven insights** — all within a clean, scalable monorepo setup.

---

## 🎯 Project Goals

- Design and simulate a **hybrid infrastructure automation** platform
- Implement **end-to-end orchestration** with Terraform, Ansible, and Temporal
- Expose a **React-based management console** for platform services
- Integrate **AI-driven anomaly detection and policy recommendations**
- Follow **modern CI/CD pipelines** and **GitOps best practices**
- Keep development **lightweight, cloud-friendly, and cost-optimized**

---

sequenceDiagram
participant User 
participant UI as React Login(Auth)
participant API as Python Backend
participant Worker as Go Temporal Worker
participant Infra as Terraform/Ansible

User->>UI: Click "Provision Resource"
UI->>API: POST /api/v1/resources
API->>Worker: Trigger Temporal Workflow
Worker->>Infra: Run Terraform + Ansible
Infra->>Worker: Return Status
Worker->>API: Update Workflow State
API->>UI: Return Status / Result

# NebulaOps - MVP PoC Scaffold

## 🎯 Goal: Demonstrate End-to-End IaC Orchestration Flow
Build this in **2-3 weeks** to showcase understanding of hybrid compute platforms.

---

## 📁 Simplified Project Structure

```
nebulaops/
├── frontend/                          # React UI
│   ├── src/
│   │   ├── components/
│   │   │   ├── LoginForm.tsx          # Simple auth UI
│   │   │   ├── Dashboard.tsx          # Main dashboard
│   │   │   ├── ResourceForm.tsx       # Provision form
│   │   │   └── WorkflowStatus.tsx     # Show workflow progress
│   │   ├── services/
│   │   │   └── api.ts                 # API client
│   │   ├── App.tsx
│   │   └── main.tsx
│   ├── package.json
│   ├── vite.config.ts
│   └── tailwind.config.js
│
├── backend/                           # Python FastAPI
│   ├── app/
│   │   ├── api/
│   │   │   ├── auth.py                # Login endpoint
│   │   │   ├── resources.py           # Resource CRUD
│   │   │   └── workflows.py           # Trigger workflows
│   │   ├── models.py                  # SQLAlchemy models
│   │   ├── database.py                # DB connection
│   │   ├── temporal_client.py         # Temporal integration
│   │   └── main.py                    # FastAPI app
│   ├── requirements.txt
│   └── .env.example
│
├── workers/                           # Go Temporal Workers
│   ├── cmd/
│   │   └── main.go                    # Worker entry point
│   ├── workflows/
│   │   └── provision.go               # Main workflow
│   ├── activities/
│   │   ├── terraform.go               # Terraform execution
│   │   └── ansible.go                 # Ansible execution
│   ├── go.mod
│   └── go.sum
│
├── infrastructure/
│   ├── terraform/
│   │   ├── main.tf                    # Simple EC2/S3 example
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── ansible/
│       └── configure.yml              # Basic server config
│
├── docker-compose.yml                 # Local dev stack
├── Makefile                           # Quick commands
├── README.md
└── .env.example
```

---



## 🛠️ Technology Stack (Minimal)

### Frontend
- **React 18** + TypeScript + Vite
- **Tailwind CSS** for styling
- **Axios** for API calls
- **React Router** for navigation
- Just 4-5 components total

### Backend
- **FastAPI** (Python 3.11+)
- **SQLite** (no Postgres setup needed initially)
- **Temporal Python SDK** (client only)
- **JWT** for auth (simple hardcoded user is fine)
- 3 API endpoints: auth, create resource, get status

### Workers
- **Go 1.21+**
- **Temporal Go SDK**
- **Exec commands** to run Terraform/Ansible
- 1 workflow, 2 activities

### Infrastructure
- **Terraform**: Deploy 1 AWS EC2 instance (or LocalStack for demo)
- **Ansible**: Install Nginx on that instance
- Use free tier resources or local simulation

### Infrastructure (Dev)
- **Docker Compose**: Temporal, PostgreSQL (for Temporal), Redis
- Everything runs locally

---

## 📋 Implementation Checklist (MVP)

### Week 1: Foundation
- [x] Project structure
- [ ] Docker Compose with Temporal + DB
- [ ] FastAPI backend skeleton
- [ ] React frontend skeleton
- [ ] Simple auth (hardcoded user is OK)
- [ ] Basic DB models (User, Resource, WorkflowExecution)

### Week 2: Core Flow
- [ ] Go Temporal worker setup
- [ ] Workflow: ProvisionResource
- [ ] Activity: RunTerraform (shell exec)
- [ ] Activity: RunAnsible (shell exec)
- [ ] Backend: Trigger workflow endpoint
- [ ] Backend: Get workflow status endpoint
- [ ] Frontend: Resource form
- [ ] Frontend: Status polling

### Week 3: Polish & Demo
- [ ] Error handling
- [ ] Loading states in UI
- [ ] Terraform example (EC2 instance)
- [ ] Ansible playbook (install Nginx)
- [ ] README with demo instructions
- [ ] Screen recording of full flow

---

## 🎬 Demo Scenario

**User Story**: Provision a web server

1. **Login** → Mock JWT token
2. **Dashboard** → Shows existing resources
3. **Click "New Resource"** → Form appears
4. **Fill Form**:
   - Name: "demo-webserver"
   - Type: "ec2-instance"
   - Region: "us-east-1"
5. **Submit** → API creates workflow
6. **Status Page** → Shows:
   - ✓ Terraform Plan
   - ✓ Terraform Apply (EC2 created)
   - ⏳ Ansible Configure (installing Nginx)
   - ✓ Ansible Complete
7. **Result** → Shows IP address, SSH command


## 🎓 Interview Talking Points

When presenting this PoC:

1. **"I built a hybrid compute orchestration platform using Temporal"**
   - Shows understanding of distributed workflows
   
2. **"The Go workers handle infrastructure provisioning asynchronously"**
   - Demonstrates microservices + async patterns
   
3. **"Terraform for infrastructure, Ansible for configuration"**
   - Standard IaC practice separation of concerns
   
4. **"FastAPI exposes APIs that React consumes with real-time status updates"**
   - Full-stack capability
   
5. **"Workflow state is durable in Temporal, UI polls for updates"**
   - Understanding of event-driven architecture

---

## 📊 What to Show in Demo

1. **Architecture Diagram** (draw.io)
2. **Live Demo**: 
   - Login → Create Resource → Watch it provision → Show Terraform state
3. **Code Walkthrough**:
   - Show Temporal workflow code
   - Show activity that runs Terraform
   - Show FastAPI endpoint that triggers workflow
4. **Temporal UI**: Show workflow execution history
5. **Discussion**: How you'd scale this (add queues, split workers, add monitoring)

---

## 🚫 What to Skip (For Now)

- ❌ Kubernetes deployment
- ❌ CI/CD pipelines  
- ❌ AI/ML services
- ❌ Prometheus/Grafana
- ❌ Complex auth (OAuth)
- ❌ Multi-environment setup
- ❌ Comprehensive testing
- ❌ Production secrets management

**Keep it simple. Focus on the core flow.**

---

## 💡 Quick Wins for Your Resume

- "Built IaC automation platform with Temporal workflows"
- "Implemented Go workers for Terraform/Ansible orchestration"
- "Created React dashboard for infrastructure provisioning"
- "Integrated Python FastAPI with Temporal for async workflows"
- "Demonstrated GitOps patterns with infrastructure as code"

---

## 🎯 Success Criteria

✅ User can click a button and see Terraform/Ansible run
✅ Workflow state is visible in Temporal UI
✅ Frontend shows real-time progress
✅ Infrastructure actually gets created (EC2/VM)

