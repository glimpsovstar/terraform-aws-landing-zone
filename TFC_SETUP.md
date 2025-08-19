# Module Registry Instructions

## Publishing to TFC Private Registry

### Prerequisites
✅ Repository is public or TFC has access to private repo
✅ Module follows standard structure (main.tf, variables.tf, outputs.tf)
✅ Semantic version tags exist (v1.0.0, v1.1.0)
✅ Repository contains examples/ directory

### Steps to Publish

1. **Access Module Registry**
   - Go to https://app.terraform.io/
   - Navigate to Registry → Modules
   - Click "Publish" → "Module"

2. **Connect Repository**
   - Choose VCS Provider: GitHub
   - Select Organization: glimpsovstar
   - Select Repository: terraform-aws-landing-zone
   - Click "Publish Module"

3. **Module Details**
   - Name: `aws-landing-zone`
   - Provider: `aws`
   - Description: "Production-ready AWS landing zone"
   - Tags: aws, vpc, landing-zone, security, s3, iam

4. **Verify Publication**
   - Module should appear in your private registry
   - Version v1.1.0 should be available
   - Documentation should auto-generate from README.md

## Enabling No-Code Provisioning

### Step 1: Module Configuration
✅ Variables have descriptive names and descriptions
✅ Variables include validation rules
✅ Boolean variables for toggle switches
✅ Constrained variables for dropdowns

### Step 2: Create No-Code Workspace

1. **New Workspace**
   - Go to Workspaces → "Create workspace"
   - Choose "Module-based workflow"
   - Search for your published module

2. **Configure Variables**
   The No-Code interface will show:
   - **Project Settings** (required fields)
     - Project Name: Text input with validation
     - Environment: Dropdown (dev, staging, prod)
     - Region: Dropdown with AWS regions
   
   - **Infrastructure Options** (toggles)
     - Enable NAT Gateway: Boolean toggle
     - Single NAT Gateway: Boolean toggle  
     - Enable Flow Logs: Boolean toggle
   
   - **Configuration** (inputs)
     - VPC CIDR: Text input with CIDR validation
     - Log Retention Days: Dropdown with valid periods
     - Custom Tags: Key-value editor

3. **Deploy**
   - Fill out the form
   - Click "Create workspace"
   - TFC generates HCL automatically
   - Plan and apply through UI

## Module Usage Examples

### CLI/API Usage
```hcl
module "landing_zone" {
  source = "app.terraform.io/YOUR_ORG/aws-landing-zone/aws"
  version = "~> 1.1.0"
  
  project_name = "my-project"
  environment  = "production"
  region       = "us-west-2"
}
```

### No-Code Usage
- Use TFC web interface
- Fill out form fields
- Deploy with one click
- No HCL knowledge required

## Next Steps
1. Test the module in a development workspace
2. Create documentation for your team
3. Set up automated testing with TFC
4. Consider creating additional modules for other components
