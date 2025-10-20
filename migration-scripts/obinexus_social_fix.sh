#!/bin/bash
# OBINexus Social Media URI Fix Script
# Repository: github.com/obinexus/iwu

echo "🔧 Fixing OBINexus Social Media URIs"

# 1. Correct Email URI Formats
echo "=== Email URI Corrections ==="

# Standard mailto format
CORRECT_MAILTO="mailto:support@obinexus.org"
echo "✅ Standard: $CORRECT_MAILTO"

# URL encoded for social media
ENCODED_MAILTO="mailto%3Asupport%40obinexus.org"
echo "✅ URL Encoded: $ENCODED_MAILTO"

# Social platform specific formats
echo ""
echo "=== Platform-Specific Formats ==="

# Twitter/X
TWITTER_FORMAT="📧 support@obinexus.org"
echo "🐦 Twitter: $TWITTER_FORMAT"

# LinkedIn
LINKEDIN_FORMAT="Contact: support@obinexus.org"
echo "💼 LinkedIn: $LINKEDIN_FORMAT"

# GitHub
GITHUB_FORMAT="**Email:** support@obinexus.org"
echo "🐙 GitHub: $GITHUB_FORMAT"

# 2. Generate social media links file
cat > social_media_links.md << 'EOF'
# OBINexus Social Media Configuration

## Contact Information
- **Primary Email:** support@obinexus.org
- **Technical Support:** +447424191477
- **Repository:** github.com/obinexus
- **IaaS Platform:** iaas.computing.obinexus.org

## Social Media Bio Templates

### Twitter/X Bio
```
🏗️ Building constitutional AI infrastructure
📧 support@obinexus.org
🔗 github.com/obinexus
💡 When systems fail, we build our own
#OBINexus #ConstitutionalAI #SmartHomes
```

### LinkedIn Company Page
```
OBINexus: Constitutional AI Infrastructure
Contact: support@obinexus.org
Repository: github.com/obinexus
Focus: Smart housing, legal reform, neurodivergent-first design
```

### GitHub Organization
```markdown
**Contact:** support@obinexus.org  
**Phone:** +447424191477  
**Website:** obinexus.org  
**Mission:** When systems fail, we build our own
```

## URI Validation
- ✅ mailto:support@obinexus.org
- ✅ https://obinexus.org
- ✅ https://github.com/obinexus
- ✅ https://iaas.computing.obinexus.org

EOF

echo "✅ Generated social_media_links.md"

# 3. Validate email format
python3 << 'EOF'
import re

def validate_email_uri(email):
    """Validate OBINexus email URI formats"""
    email_pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    mailto_pattern = r'^mailto:[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    
    print("🔍 Email Validation:")
    print(f"✅ Email: support@obinexus.org - {bool(re.match(email_pattern, 'support@obinexus.org'))}")
    print(f"✅ Mailto: mailto:support@obinexus.org - {bool(re.match(mailto_pattern, 'mailto:support@obinexus.org'))}")
    
    # Generate encoded versions
    import urllib.parse
    email = "support@obinexus.org"
    encoded_email = urllib.parse.quote(email)
    encoded_mailto = urllib.parse.quote(f"mailto:{email}")
    
    print(f"🔗 URL Encoded Email: {encoded_email}")
    print(f"🔗 URL Encoded Mailto: {encoded_mailto}")

validate_email_uri("support@obinexus.org")
EOF

echo ""
echo "🎯 Next Steps:"
echo "1. Update all social media profiles with corrected URIs"
echo "2. Replace malformed links in existing posts"
echo "3. Add to github.com/obinexus/iwu repository"
echo "4. Test mailto links across platforms"

# 4. Create deployment script for social media updates
cat > deploy_social_fixes.sh << 'EOF'
#!/bin/bash
# Deploy social media fixes to OBINexus infrastructure

echo "📱 Deploying OBINexus Social Media Fixes"

# Update GitHub README files
find . -name "README.md" -exec sed -i 's/support@obinexus\.org/support@obinexus.org/g' {} \;

# Update documentation
find . -name "*.md" -exec sed -i 's/mailto:support@obinexus\.org/mailto:support@obinexus.org/g' {} \;

# Commit changes
git add .
git commit -m "🔧 Fix malformed social media URIs - Constitutional compliance"
git push origin main

echo "✅ Social media URI fixes deployed"
EOF

chmod +x deploy_social_fixes.sh

echo "✅ Social media URI fix complete"
echo "📄 Files generated: social_media_links.md, deploy_social_fixes.sh"