# Robot Framework + Stubby4j
## 🚀 Stubby4j – Lightweight Mock HTTP Server

**Stubby4j** คือเครื่องมือสำหรับจำลอง Web API (Mock Server) ที่พัฒนาโดยใช้ Java  
ช่วยให้คุณสามารถทดสอบระบบ frontend หรือ integration ได้โดยไม่ต้องพึ่งพา backend จริง

---

## 🔧 เหมาะสำหรับใคร?
- ทีม **Frontend / Mobile** ที่ต้องการทดสอบ API โดยไม่ต้องรอ backend เสร็จ
- ทีม **QA / Automation** ที่เขียนเทสแบบ integration หรือ contract testing
- ทีม **DevOps** ที่ต้องการจำลอง 3rd party API ใน CI/CD pipeline
- นักเรียน / นักพัฒนา ที่อยากทดสอบระบบแบบไม่ต้องมีของจริง

---

## ✅ จุดเด่นของ Stubby4j
- จำลอง HTTP(S), REST, SOAP, WebSocket ได้ง่าย
- รองรับไฟล์ `.yaml` แบบ human-readable สำหรับกำหนด request/response
- รองรับ:
  - Regex matching
  - Header validation
  - Delay response
  - Dynamic response
  - Fault injection
- รันได้ด้วย JAR หรือ Docker (เหมาะกับ CI/CD)

---

## วิธีใช้งาน (Java)

1. เปิด terminal ใช้คำสั่ง : git clone https://github.com/robojourney101/robot_stubby4j.git

3. ใช้คำสั่งเพื่อรัน Stubby4j (ต้องใช้ Java 8 ขึ้นไป):
   ```bash
   java -jar stubby4j-7.6.1.jar -d stubs/stub.yaml
   ```
   API จะรันบน:
   - `http://localhost:8882/hello`
   - Admin portal: `http://localhost:8889/status`

4. รัน Robot Framework:
   ```bash
   pip3 install robotframework-requests
   robot -d result tests/test_stubby.robot
   ```

---

## 📦 การติดตั้ง & เริ่มต้นใช้งาน

### 1. ดาวน์โหลดไฟล์ `.jar` หากต้องการเปลี่ยน version
👉 [ดาวน์โหลด stubby4j-7.6.1.jar (Maven Central)](https://repo1.maven.org/maven2/io/github/azagniotov/stubby4j/)

> ต้องใช้ Java 8 ขึ้นไป

---

### 2. ตัวอย่าง สร้างไฟล์ `stub.yaml`
```yaml
- description: Hello endpoint
  request:
    method: GET
    url: ^/hello$
  response:
    status: 200
    headers:
      content-type: application/json
    body: '{"message": "Hello from Stubby4j!"}'
