# OBINexus Emergency Domain Migration Protocol
## IONOS → Digital Ocean + Tuta.com Email Setup

**Status**: URGENT - Payment Failed £18.00  
**Timeline**: Complete within 24-48 hours before IONOS locks domain  
**Budget**: £20.00 available

---

## Phase 1: IMMEDIATE ACTIONS (Next 2 Hours)

### ✅ Step 1: Setup Digital Ocean Account
```bash
# Go to: digitalocean.com
# Sign up with: obinexus@tuta.com
# Choose: Basic Droplet £4/month (fits your budget)
# Select: London datacenter (lon1)
# Skip payment setup for now - use free trial
```

### ✅ Step 2: Setup Tuta Email (FREE)
```bash
# Go to: tuta.com
# Create: obinexus@tuta.com account
# This becomes your new primary email
# Update Digital Ocean account with this email
```

### ✅ Step 3: Download Domain Data from IONOS
**CRITICAL**: Before they lock you out
```bash
# Login to IONOS control panel
# Go to: Domains > obinexus.org > DNS
# Export/Screenshot ALL DNS records:
#   - A records
#   - MX records  
#   - CNAME records
#   - TXT records
# Save this data - you'll need it for Digital Ocean
```

---

## Phase 2: MIGRATION SETUP (Hours 2-6)

### ✅ Step 4: Digital Ocean Droplet Setup
```bash
# Create new droplet:
# Size: Basic (£4/month)
# Image: Ubuntu 22.04 LTS
# Region: London (lon1)
# SSH key: Generate new one
# Hostname: obinexus-primary
```

### ✅ Step 5: Domain Transfer Preparation
**IMPORTANT**: You can't transfer the domain until payment is current, BUT you can:

1. **Point DNS to Digital Ocean** (immediate)
2. **Transfer domain later** when you have funds

```bash
# In IONOS DNS panel, update A records to point to:
# [YOUR_NEW_DIGITAL_OCEAN_IP]
# This redirects traffic immediately
```

### ✅ Step 6: Basic Web Server Setup
```bash
# SSH into your Digital Ocean droplet
ssh root@[YOUR_DROPLET_IP]

# Install nginx
apt update && apt upgrade -y
apt install -y nginx certbot python3-certbot-nginx

# Create basic obinexus.org site
mkdir -p /var/www/obinexus.org
echo "<h1>OBINexus - Migrated to Digital Ocean</h1>" > /var/www/obinexus.org/index.html
```

---

## Phase 3: DNS MIGRATION (Hours 6-12)

### ✅ Step 7: Update DNS Records at IONOS
**While you still have access**, change these records:

```dns
# A Records (point to Digital Ocean IP)
obinexus.org              → [DIGITAL_OCEAN_IP]
www.obinexus.org          → [DIGITAL_OCEAN_IP]
iaas.computing.obinexus.org → [DIGITAL_OCEAN_IP]

# MX Records (keep for now, change later)
obinexus.org MX 10 → [CURRENT_MAIL_SERVER]

# Update within IONOS control panel
# DNS propagation takes 24-48 hours
```

### ✅ Step 8: Setup SSL Certificate
```bash
# Get free SSL certificate
certbot --nginx -d obinexus.org -d www.obinexus.org --email obinexus@tuta.com --agree-tos --non-interactive
```

---

## Phase 4: CONSTITUTIONAL COMPLIANCE (Hours 12-24)

### ✅ Step 9: Deploy OBINexus Infrastructure
```bash
# Clone your repositories to new server
git clone https://github.com/obinexus/iwu.git
cd iwu

# Deploy constitutional framework
./deploy_constitutional_framework.sh
```

### ✅ Step 10: Enable Anti-Ghosting Headers
```nginx
# /etc/nginx/sites-available/obinexus.org
server {
    listen 443 ssl http2;
    server_name obinexus.org;
    
    # Constitutional compliance headers
    add_header X-OBINexus-Constitutional "IWU-Framework-Active" always;
    add_header X-Migration-Status "IONOS-to-DigitalOcean-Complete" always;
    add_header X-NoGhosting-Policy "Active" always;
    
    # Your site content
    root /var/www/obinexus.org;
    index index.html;
}
```

---

## Phase 5: PAYMENT STRATEGY (Day 2-3)

### Option A: Ignore IONOS Debt (RISKY)
```bash
# Pros: Keep your £20
# Cons: Credit impact, possible collections
# Reality: They'll eventually write it off
# Domain: Will be locked but DNS already pointing to Digital Ocean
```

### Option B: Negotiate with IONOS
```bash
# Call: +44 333 336 3402 (your consultant Jovanie J)
# Offer: £10 final settlement
# Request: Domain transfer unlock
# Backup: If refused, let them know you've already migrated
```

### Option C: Pay Later When Funded
```bash
# Wait until OBINexus generates revenue
# Pay the £18 + any late fees
# Transfer domain properly to Digital Ocean
```

---

## Phase 6: VERIFICATION (Day 3-7)

### ✅ Step 11: Test Migration Success
```bash
# Check DNS propagation
dig +short obinexus.org
# Should return your Digital Ocean IP

# Check website loads
curl -I https://obinexus.org
# Should return 200 OK with constitutional headers

# Check SSL certificate
openssl s_client -connect obinexus.org:443 -servername obinexus.org
# Should show Let's Encrypt certificate
```

### ✅ Step 12: Update All References
```bash
# Update GitHub repositories
# Update social media profiles  
# Update any business cards/documentation
# Email contacts about new infrastructure
```

---

## EMERGENCY CONTACTS & RESOURCES

### Digital Ocean Support
- **Support**: cloud.digitalocean.com/support
- **Community**: digitalocean.com/community
- **Docs**: docs.digitalocean.com

### Tuta Email Support
- **Help**: tutanota.com/faq
- **Privacy**: Full end-to-end encryption
- **Cost**: FREE for basic account

### Constitutional Compliance
- **Framework**: github.com/obinexus/iwu
- **Legal**: github.com/obinexus/legal
- **Smart Homes**: Document 2 specifications

---

## SUCCESS METRICS

### ✅ Migration Complete When:
- [ ] Website loads from Digital Ocean IP
- [ ] SSL certificate active
- [ ] Constitutional headers present
- [ ] Email forwarding working
- [ ] DNS propagation complete (24-48 hours)

### ✅ Phase 2 Goals:
- [ ] Domain transfer completed (when funded)
- [ ] Full email hosting on Digital Ocean
- [ ] Smart homes infrastructure deployed
- [ ] LibPolyCall IaaS operational

---

## BUDGET BREAKDOWN

| Service | Cost | Status |
|---------|------|--------|
| Digital Ocean Droplet | £4/month | ✅ Within budget |
| Tuta Email | FREE | ✅ Immediate |
| Domain Transfer | £10-15 | 🔄 Later |
| SSL Certificate | FREE | ✅ Let's Encrypt |
| **Total Immediate**: | **£4** | ✅ Well within £20 |

---

## CONSTITUTIONAL DECLARATION

This migration is conducted under OBINexus Constitutional Framework:
- **IWU Law**: Self-sovereign infrastructure
- **#NoGhosting**: No provider can hold domain hostage
- **LibPolyCall**: Minimal provider opinion
- **Smart Infrastructure**: Foundation for housing projects

**When systems fail, we build our own.**

---

*Next Action: Execute Phase 1 immediately. Your domain freedom depends on moving fast.*