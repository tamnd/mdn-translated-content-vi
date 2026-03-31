---
title: Máy chủ Node.js không có framework
short-title: Máy chủ Node.js thuần túy
slug: Learn_web_development/Extensions/Server-side/Node_server_without_framework
page-type: guide
sidebar: learnsidebar
---

Bài viết này trình bày một máy chủ tệp tĩnh được xây dựng bằng [Node.js](https://nodejs.org/en/) mà không sử dụng bất kỳ framework nào.
Trạng thái hiện tại của Node.js là hầu hết mọi thứ chúng ta cần cho máy chủ tệp tĩnh đều được cung cấp bởi các API tích hợp sẵn và một vài dòng mã.

## Ví dụ

Một máy chủ tệp tĩnh được xây dựng bằng Node.js:

```js
import * as fs from "node:fs";
import * as http from "node:http";
import * as path from "node:path";

const PORT = 8000;

const MIME_TYPES = {
  default: "application/octet-stream",
  html: "text/html; charset=UTF-8",
  js: "text/javascript",
  css: "text/css",
  png: "image/png",
  jpg: "image/jpeg",
  gif: "image/gif",
  ico: "image/x-icon",
  svg: "image/svg+xml",
};

const STATIC_PATH = path.join(process.cwd(), "./static");

const toBool = [() => true, () => false];

const prepareFile = async (url) => {
  const urlAsPath = decodeURI(url);
  const paths = [STATIC_PATH, urlAsPath];
  if (url.endsWith("/")) paths.push("index.html");
  const filePath = path.join(...paths);
  const pathTraversal = !filePath.startsWith(STATIC_PATH);
  const exists = await fs.promises.access(filePath).then(...toBool);
  const found = !pathTraversal && exists;
  const streamPath = found ? filePath : `${STATIC_PATH}/404.html`;
  const ext = path.extname(streamPath).substring(1).toLowerCase();
  const stream = fs.createReadStream(streamPath);
  return { found, ext, stream };
};

http
  .createServer(async (req, res) => {
    const file = await prepareFile(req.url);
    const statusCode = file.found ? 200 : 404;
    const mimeType = MIME_TYPES[file.ext] || MIME_TYPES.default;
    res.writeHead(statusCode, { "Content-Type": mimeType });
    file.stream.pipe(res);
    console.log(`${req.method} ${req.url} ${statusCode}`);
  })
  .listen(PORT);

console.log(`Server running at http://127.0.0.1:${PORT}/`);
```

### Phân tích

Các dòng sau nhập các mô-đun Node.js nội bộ.

```js
import * as fs from "node:fs";
import * as http from "node:http";
import * as path from "node:path";
```

Tiếp theo chúng ta có một hàm để tạo máy chủ. `https.createServer` trả về một đối tượng `Server`, mà chúng ta có thể khởi động bằng cách lắng nghe trên `PORT`.

```js
http
  .createServer((req, res) => {
    /* handle http requests */
  })
  .listen(PORT);

console.log(`Server running at http://127.0.0.1:${PORT}/`);
```

Hàm bất đồng bộ `prepareFile` trả về cấu trúc: `{ found: boolean, ext: string, stream: ReadableStream }`.
Nếu tệp có thể được phục vụ (tiến trình máy chủ có quyền truy cập và không tìm thấy lỗ hổng path-traversal), chúng ta sẽ trả về trạng thái HTTP `200` như là `statusCode` chỉ ra thành công (nếu không chúng ta trả về `HTTP 404`).
Lưu ý rằng các mã trạng thái khác có thể được tìm thấy trong `http.STATUS_CODES`.
Với trạng thái `404` chúng ta sẽ trả về nội dung của tệp `'/404.html'`.

Phần mở rộng của tệp được yêu cầu sẽ được phân tích và chuyển thành chữ thường. Sau đó chúng ta sẽ tìm kiếm bộ sưu tập `MIME_TYPES` để tìm đúng [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types). Nếu không tìm thấy kết quả phù hợp, chúng ta sử dụng `application/octet-stream` làm kiểu mặc định.

Cuối cùng, nếu không có lỗi, chúng ta gửi tệp được yêu cầu. `file.stream` sẽ chứa một luồng `Readable` sẽ được chuyển vào `res` (một thể hiện của luồng `Writable`).

```js
res.writeHead(statusCode, { "Content-Type": mimeType });
file.stream.pipe(res);
```
