---
title: "NavigationHistoryEntry: key property"
short-title: key
slug: Web/API/NavigationHistoryEntry/key
page-type: web-api-instance-property
browser-compat: api.NavigationHistoryEntry.key
---

{{APIRef("Navigation API")}}

Thuộc tính chỉ đọc **`key`** của giao diện {{domxref("NavigationHistoryEntry")}} trả về `key` của mục lịch sử, hoặc một chuỗi rỗng nếu tài liệu hiện tại không hoạt động đầy đủ. Đây là một giá trị duy nhất do UA tạo ra, đại diện cho vị trí của mục lịch sử trong danh sách. Nó được dùng để điều hướng đến vị trí cụ thể đó thông qua {{domxref("Navigation.traverseTo()")}}.

Điều này khác với {{domxref("NavigationHistoryEntry.id", "id")}} của một mục lịch sử. `id` là một giá trị duy nhất do UA tạo ra, luôn đại diện cho một mục lịch sử cụ thể thay vì vị trí của nó trong danh sách.

## Giá trị

Một chuỗi biểu thị `key` của {{domxref("NavigationHistoryEntry")}}.

## Ví dụ

### Cách dùng cơ bản

```js
const current = navigation.currentEntry;
console.log(current.key);
```

### Thiết lập nút home

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
