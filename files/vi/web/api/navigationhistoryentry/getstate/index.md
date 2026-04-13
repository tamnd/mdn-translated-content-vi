---
title: "NavigationHistoryEntry: getState() method"
short-title: getState()
slug: Web/API/NavigationHistoryEntry/getState
page-type: web-api-instance-method
browser-compat: api.NavigationHistoryEntry.getState
---

{{APIRef("Navigation API")}}

Phương thức **`getState()`** của giao diện {{domxref("NavigationHistoryEntry")}} trả về một bản sao của trạng thái do nhà phát triển cung cấp gắn với mục lịch sử này.

## Cú pháp

```js-nolint
getState()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị biểu thị trạng thái. Đây có thể là bất kỳ kiểu dữ liệu nào [có thể structured-clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).

Nếu không có trạng thái nào được định nghĩa hoặc nếu tài liệu hiện tại không hoạt động đầy đủ, nó sẽ trả về `undefined`.

### Ngoại lệ

Không có.

## Ví dụ

```js
async function handleReload() {
  // Cập nhật trạng thái hiện có thông qua reload()
  await navigation.reload({
    state: { ...navigation.currentEntry.getState(), newState: 3 },
  });

  // In trạng thái hiện tại ra console
  const current = navigation.currentEntry;
  console.log(current.getState());
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
- Các phương thức cho phép cập nhật trạng thái - {{domxref("Navigation.navigate()")}}, {{domxref("Navigation.reload()")}}, và {{domxref("Navigation.updateCurrentEntry()")}}
