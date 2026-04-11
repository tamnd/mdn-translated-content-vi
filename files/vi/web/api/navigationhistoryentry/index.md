---
title: NavigationHistoryEntry
slug: Web/API/NavigationHistoryEntry
page-type: web-api-interface
browser-compat: api.NavigationHistoryEntry
---

{{APIRef("Navigation API")}}

Giao diện **`NavigationHistoryEntry`** của {{domxref("Navigation API", "Navigation API", "", "nocode")}} đại diện cho một mục lịch sử điều hướng đơn lẻ.

Các đối tượng này thường được truy cập qua thuộc tính {{domxref("Navigation.currentEntry")}} và phương thức {{domxref("Navigation.entries()")}}.

Navigation API chỉ hiển thị các mục lịch sử được tạo trong ngữ cảnh duyệt web hiện tại và có cùng nguồn gốc với trang hiện tại, nhờ đó cung cấp danh sách chính xác các mục lịch sử trước đó chỉ cho ứng dụng của bạn. Điều này giúp việc duyệt qua lịch sử ít mong manh hơn so với {{domxref("History API", "History API", "", "nocode")}} cũ hơn.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref("NavigationHistoryEntry.id", "id")}} {{ReadOnlyInline}}
  - : Trả về `id` của mục lịch sử. Đây là một giá trị duy nhất do UA tạo ra, luôn đại diện cho một mục lịch sử cụ thể, hữu ích để đối chiếu với tài nguyên bên ngoài như bộ nhớ đệm lưu trữ.
- {{domxref("NavigationHistoryEntry.index", "index")}} {{ReadOnlyInline}}
  - : Trả về chỉ số của mục lịch sử trong danh sách các mục lịch sử, hoặc `-1` nếu mục đó không xuất hiện trong danh sách.
- {{domxref("NavigationHistoryEntry.key", "key")}} {{ReadOnlyInline}}
  - : Trả về `key` của mục lịch sử. Đây là một giá trị duy nhất do UA tạo ra, đại diện cho vị trí của mục trong danh sách thay vì chính mục đó. Nó được dùng để điều hướng đến vị trí cụ thể đó thông qua {{domxref("Navigation.traverseTo()")}}.
- {{domxref("NavigationHistoryEntry.sameDocument", "sameDocument")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu mục lịch sử này thuộc cùng `document` với giá trị {{domxref("Document")}} hiện tại, ngược lại trả về `false`.
- {{domxref("NavigationHistoryEntry.url", "url")}} {{ReadOnlyInline}}
  - : Trả về URL tuyệt đối của mục lịch sử này. Nếu mục đó tương ứng với một tài liệu khác với tài liệu hiện tại và tài liệu đó được tìm nạp với tiêu đề {{httpheader("Referrer-Policy")}} là `no-referrer` hoặc `origin`, thuộc tính sẽ trả về `null`.

## Phương thức thể hiện

_Kế thừa các phương thức từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref("NavigationHistoryEntry.getState", "getState()")}}
  - : Trả về một bản sao của trạng thái hiện có gắn với mục lịch sử này.

## Sự kiện

- {{domxref("NavigationHistoryEntry/dispose_event", "dispose")}}
  - : Kích hoạt khi mục không còn là một phần của danh sách mục lịch sử.

## Ví dụ

```js
function initHomeBtn() {
  // Lấy key của mục đầu tiên được tải
  // để người dùng luôn có thể quay lại chế độ xem này.
  const { key } = navigation.currentEntry;
  backToHomeButton.onclick = () => {
    navigation.traverseTo(key);
  };
}
// Chặn các sự kiện navigate, chẳng hạn như nhấp vào liên kết, và
// thay thế chúng bằng các lần điều hướng đơn trang
navigation.addEventListener("navigate", (event) => {
  event.intercept({
    async handler() {
      // Điều hướng đến một chế độ xem khác,
      // nhưng nút "home" sẽ luôn hoạt động.
    },
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
- [Navigation API live demo](https://mdn.github.io/dom-examples/navigation-api/) ([xem mã nguồn demo](https://github.com/mdn/dom-examples/tree/main/navigation-api))
