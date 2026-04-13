---
title: Network Information API
slug: Web/API/Network_Information_API
page-type: web-api-overview
browser-compat: api.NetworkInformation
spec-urls: https://wicg.github.io/netinfo/
---

{{DefaultAPISidebar("Network Information API")}} {{AvailableInWorkers}}

**Network Information API** cung cấp thông tin về kết nối của hệ thống theo loại kết nối chung, chẳng hạn như `wifi`, `cellular`, v.v.
API này có thể được dùng để chọn nội dung độ phân giải cao hoặc thấp dựa trên kết nối của người dùng.

Giao diện này gồm một đối tượng {{domxref("NetworkInformation")}} duy nhất, mà một thể hiện của nó được trả về bởi thuộc tính {{domxref("Navigator.connection")}} hoặc thuộc tính {{domxref("WorkerNavigator.connection")}}.

## Giao diện

- {{domxref("NetworkInformation")}}
  - : Cung cấp thông tin về kết nối mà một thiết bị đang dùng để giao tiếp với mạng và cung cấp một cách để script được thông báo nếu kiểu kết nối thay đổi. Giao diện `NetworkInformation` không thể được khởi tạo trực tiếp. Thay vào đó, nó được truy cập thông qua giao diện {{domxref("Navigator")}} hoặc giao diện {{domxref("WorkerNavigator")}}.

### Mở rộng cho các giao diện khác

- {{domxref("Navigator.connection")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("NetworkInformation")}} chứa thông tin về kết nối mạng của một thiết bị.
- {{domxref("WorkerNavigator.connection")}} {{ReadOnlyInline}}
  - : Cung cấp một đối tượng {{domxref("NetworkInformation")}} chứa thông tin về kết nối mạng của một thiết bị.

## Ví dụ

### Phát hiện thay đổi kết nối

Ví dụ này theo dõi các thay đổi trong kết nối của người dùng.

```js
let type = navigator.connection.effectiveType;

function updateConnectionStatus() {
  console.log(
    `Loại kết nối đã thay đổi từ ${type} thành ${navigator.connection.effectiveType}`,
  );
  type = navigator.connection.effectiveType;
}

navigator.connection.addEventListener("change", updateConnectionStatus);
```

### Tải trước tài nguyên lớn

Đối tượng connection hữu ích để quyết định có nên tải trước các tài nguyên tiêu tốn nhiều băng thông hoặc bộ nhớ hay không. Ví dụ này sẽ được gọi ngay sau khi trang tải để kiểm tra xem có loại kết nối nào mà việc tải trước video là không nên hay không. Nếu phát hiện kết nối di động, cờ `preloadVideo` sẽ được đặt thành `false`. Để đơn giản và rõ ràng, ví dụ này chỉ kiểm tra một loại kết nối. Trong thực tế, trường hợp sử dụng thường sẽ dùng câu lệnh switch hoặc một phương pháp khác để kiểm tra tất cả các giá trị có thể có của {{domxref("NetworkInformation.type")}}. Bất kể giá trị `type` là gì, bạn đều có thể ước tính tốc độ kết nối thông qua thuộc tính {{domxref("NetworkInformation.effectiveType")}}.

```js
let preloadVideo = true;
const connection = navigator.connection;
if (connection) {
  if (connection.effectiveType === "slow-2g") {
    preloadVideo = false;
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Online and offline events](/en-US/docs/Web/API/Navigator/onLine)
