---
title: Web Share API
slug: Web/API/Web_Share_API
page-type: web-api-overview
browser-compat:
  - api.Navigator.share
  - api.Navigator.canShare
spec-urls: https://w3c.github.io/web-share/
---

{{DefaultAPISidebar("Web Share API")}}{{securecontext_header}}

**Web Share API** cung cấp một cơ chế để chia sẻ văn bản, liên kết, tệp và các nội dung khác tới một _đích chia sẻ_ bất kỳ do người dùng chọn.

> [!NOTE]
> API này _không khả dụng_ trong [Web Workers](/en-US/docs/Web/API/Web_Workers_API) (không được hiển thị qua {{domxref("WorkerNavigator")}}).

> [!NOTE]
> API này không nên bị nhầm với [Web Share Target API](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/share_target), vốn cho phép một website tự khai báo chính nó là một đích chia sẻ.

## Khái niệm và cách dùng

**Web Share API** cho phép một site chia sẻ văn bản, liên kết, tệp và các nội dung khác tới các đích chia sẻ do người dùng chọn, tận dụng cơ chế chia sẻ của hệ điều hành nền tảng.
Các đích chia sẻ này thường bao gồm clipboard của hệ thống, email, danh bạ hoặc ứng dụng nhắn tin, và các kênh Bluetooth hoặc Wi‑Fi.

API chỉ có hai phương thức.
Phương thức {{domxref("navigator.canShare()")}} có thể được dùng trước để xác thực xem một số dữ liệu có thể "chia sẻ" hay không, trước khi truyền nó vào {{domxref("navigator.share()")}} để gửi.

Phương thức {{domxref("navigator.share()")}} gọi cơ chế chia sẻ gốc của hệ điều hành nền tảng và truyền dữ liệu đã chỉ định.
Nó yêu cầu {{Glossary("transient activation")}}, vì vậy phải được kích hoạt từ một sự kiện giao diện người dùng như nhấp nút.
Hơn nữa, phương thức phải chỉ định dữ liệu hợp lệ và được triển khai gốc hỗ trợ cho việc chia sẻ.

Web Share API được kiểm soát bởi [web-share](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy/web-share) Permissions Policy.
Nếu chính sách được hỗ trợ nhưng chưa được cấp, cả hai phương thức sẽ báo rằng dữ liệu không thể chia sẻ.

## Giao diện

### Mở rộng các giao diện khác

- {{domxref("navigator.canShare()")}}
  - : Trả về một giá trị boolean cho biết dữ liệu đã chỉ định có thể chia sẻ hay không.
- {{domxref("navigator.share()")}}
  - : Trả về một {{jsxref("Promise")}} sẽ được giải quyết nếu dữ liệu đã truyền được gửi thành công tới một đích chia sẻ.
    Phương thức này phải được gọi khi nhấp nút hoặc một kích hoạt người dùng khác (yêu cầu {{Glossary("transient activation")}}).

## Ví dụ

Đoạn mã dưới đây cho thấy cách bạn có thể chia sẻ một liên kết bằng {{domxref("navigator.share()")}}, được kích hoạt từ một lần nhấp nút.

```js
const shareData = {
  title: "MDN",
  text: "Học phát triển web trên MDN!",
  url: "https://developer.mozilla.org",
};

const btn = document.querySelector("button");
const resultPara = document.querySelector(".result");

// Việc chia sẻ phải được kích hoạt bởi "user activation"
btn.addEventListener("click", async () => {
  try {
    await navigator.share(shareData);
    resultPara.textContent = "MDN shared successfully";
  } catch (err) {
    resultPara.textContent = `Error: ${err}`;
  }
});
```

Ví dụ trên được lấy từ [Web share test](https://mdn.github.io/dom-examples/web-share/) của chúng tôi ([xem mã nguồn](https://github.com/mdn/dom-examples/blob/main/web-share/index.html)). Bạn cũng có thể xem nó như một ví dụ trực tiếp trong {{domxref("navigator.share()")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Share Target API](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/share_target)
