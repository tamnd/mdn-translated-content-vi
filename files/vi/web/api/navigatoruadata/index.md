---
title: NavigatorUAData
slug: Web/API/NavigatorUAData
page-type: web-api-interface
status:
  - experimental
browser-compat: api.NavigatorUAData
---

{{APIRef("User-Agent Client Hints API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Giao diện **`NavigatorUAData`** của {{domxref("User-Agent Client Hints API", "", "", "nocode")}} trả về thông tin về trình duyệt và hệ điều hành của người dùng.

Một đối tượng của giao diện này được trả về bằng cách gọi {{domxref("Navigator.userAgentData")}} hoặc {{domxref("WorkerNavigator.userAgentData")}}. Do đó, giao diện này không có hàm khởi tạo.

> [!NOTE]
> Các thuật ngữ _high entropy_ và _low entropy_ đề cập đến lượng thông tin mà các giá trị này tiết lộ về trình duyệt. Các giá trị được trả về dưới dạng thuộc tính được coi là [low entropy](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints), khó có khả năng nhận dạng người dùng. {{domxref("NavigatorUAData.getHighEntropyValues()")}} có thể được dùng để yêu cầu các giá trị [high entropy](/en-US/docs/Web/HTTP/Guides/Client_hints#high_entropy_hints) bổ sung, có thể tiết lộ thêm thông tin nhận dạng. Do đó, các giá trị này được truy xuất qua {{jsxref("Promise")}}, cho phép thời gian để trình duyệt yêu cầu quyền người dùng, hoặc thực hiện các kiểm tra khác.

## Thuộc tính phiên bản

- {{domxref("NavigatorUAData.brands")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về mảng thông tin thương hiệu chứa tên và phiên bản trình duyệt.
- {{domxref("NavigatorUAData.mobile")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về `true` nếu user-agent đang chạy trên thiết bị di động.
- {{domxref("NavigatorUAData.platform")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về thương hiệu nền tảng mà user-agent đang chạy trên.

## Phương thức phiên bản

- {{domxref("NavigatorUAData.getHighEntropyValues()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} giải quyết với đối tượng từ điển chứa thông tin low entropy và thông tin high entropy được yêu cầu về trình duyệt.
- {{domxref("NavigatorUAData.toJSON()")}} {{Experimental_Inline}}
  - : Một _serializer_ trả về biểu diễn JSON của các thuộc tính _low entropy_ của đối tượng `NavigatorUAData`.

## Ví dụ

### Lấy thương hiệu

Ví dụ dưới đây in giá trị của {{domxref("NavigatorUAData.brands")}} ra console.

```js
console.log(navigator.userAgentData.brands);
```

### Trả về giá trị high entropy

Trong ví dụ sau, một số gợi ý được yêu cầu bằng phương thức {{domxref("NavigatorUAData.getHighEntropyValues()")}}. Khi promise giải quyết, thông tin này được in ra console.

```js
navigator.userAgentData
  .getHighEntropyValues([
    "architecture",
    "model",
    "platform",
    "platformVersion",
    "fullVersionList",
  ])
  .then((ua) => {
    console.log(ua);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cải thiện quyền riêng tư người dùng và trải nghiệm nhà phát triển với User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints)
