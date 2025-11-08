#!/bin/bash
# Supabase Key Generator for Runtipi
# This script generates secure keys for your Supabase installation

echo "=================================="
echo "Supabase Key Generator for Runtipi"
echo "=================================="
echo ""

# Check if openssl is available
if ! command -v openssl &> /dev/null; then
    echo "❌ Error: openssl is not installed"
    echo "Please install openssl first"
    exit 1
fi

# Generate JWT Secret
JWT_SECRET=$(openssl rand -base64 32)

echo "✅ Keys generated successfully!"
echo ""
echo "=================================="
echo "Copy these values to Runtipi:"
echo "=================================="
echo ""
echo "1. JWT Secret:"
echo "$JWT_SECRET"
echo ""
echo "2. Anon Key (public):"
echo "   You need to create a JWT token with this payload:"
echo '   {"iss":"supabase","role":"anon","iat":1642768000}'
echo "   Signed with your JWT Secret above"
echo "   Visit: https://jwt.io to generate"
echo ""
echo "3. Service Role Key (admin):"
echo "   You need to create a JWT token with this payload:"
echo '   {"iss":"supabase","role":"service_role","iat":1642768000}'
echo "   Signed with your JWT Secret above"
echo "   Visit: https://jwt.io to generate"
echo ""
echo "=================================="
echo "Quick Instructions:"
echo "=================================="
echo "1. Copy the JWT Secret above"
echo "2. Go to https://jwt.io"
echo "3. Paste the payloads shown above"
echo "4. Enter your JWT Secret in the 'Verify Signature' section"
echo "5. Copy the 'Encoded' token for each key"
echo ""
echo "OR for testing, use the default keys in Runtipi"
echo "=================================="
