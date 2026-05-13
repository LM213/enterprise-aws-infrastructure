# Incident Example — HTTP Access Failure

## Incident Summary

The EC2-hosted web application became unreachable from the browser after a Terraform security group modification.

---

## Detection Method

Manual browser validation and curl connectivity testing.

---

## Impact

Users could not access the web application over HTTP.

---

## Timeline

| Time | Event |
|------|------|
| | Security group updated |
| | Browser validation failed |
| | EC2 health verified |
| | Security group misconfiguration identified |

---

## Root Cause

The application security group inbound rule was changed from TCP port 80 to TCP port 81, while Apache continued listening on port 80.

---

## Resolution

The security group inbound rule must be corrected back to port 80.

---

## Preventive Actions

- Review Terraform plans carefully before apply
- Implement peer review for infrastructure changes
- Use monitoring and synthetic health checks