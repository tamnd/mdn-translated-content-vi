---
title: Navigation
slug: Web/API/Navigation
page-type: web-api-interface
browser-compat: api.Navigation
---

{{APIRef("Navigation API")}}

Giao diện **`Navigation`** của {{domxref("Navigation API", "Navigation API", "", "nocode")}} cho phép kiểm soát mọi hành động điều hướng cho `window` hiện tại ở một nơi trung tâm, bao gồm khởi tạo điều hướng theo chương trình, kiểm tra các mục lịch sử điều hướng, và quản lý điều hướng khi chúng diễn ra.

Giao diện này được truy cập qua thuộc tính {{domxref("Window.navigation")}}.

Navigation API chỉ hiển thị các mục lịch sử được tạo trong ngữ cảnh duyệt web hiện tại có cùng nguồn gốc với trang hiện tại (ví dụ: không phải các điều hướng bên trong {{htmlelement("iframe")}} nhúng, hoặc điều hướng xuyên nguồn gốc), cung cấp một danh sách chính xác tất cả các mục lịch sử trước đó chỉ dành cho ứng dụng của bạn. Điều này làm cho việc duyệt lịch sử ít dễ hỏng hơn nhiều so với {{domxref("History API", "History API", "", "nocode")}} cũ.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa thuộc tính từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref("Navigation.activation", "activation")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("NavigationActivation")}} chứa thông tin về lần điều hướng xuyên tài liệu gần nhất, đã "kích hoạt" Document này.
- {{domxref("Navigation.canGoBack", "canGoBack")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu có thể điều hướng ngược trong lịch sử điều hướng
    (tức là {{domxref("Navigation.currentEntry", "currentEntry")}} không phải là mục đầu tiên trong danh sách mục lịch sử),
    và `false` nếu không thể.
- {{domxref("Navigation.canGoForward", "canGoForward")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu có thể điều hướng tới trước trong lịch sử điều hướng
    (tức là {{domxref("Navigation.currentEntry", "currentEntry")}} không phải là mục cuối cùng trong danh sách mục lịch sử),
    và `false` nếu không thể.
- {{domxref("Navigation.currentEntry", "currentEntry")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("NavigationHistoryEntry")}} đại diện cho vị trí mà người dùng hiện đang
    được điều hướng tới ngay lúc này.
- {{domxref("Navigation.transition", "transition")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("NavigationTransition")}} đại diện cho trạng thái của một điều hướng đang diễn ra,
    có thể dùng để theo dõi nó. Trả về `null` nếu hiện không có điều hướng nào đang diễn ra.

## Phương thức thể hiện

_Kế thừa phương thức từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref("Navigation.back", "back()")}}
  - : Điều hướng lùi lại một mục trong lịch sử điều hướng.
- {{domxref("Navigation.entries", "entries()")}}
  - : Trả về một mảng các đối tượng {{domxref("NavigationHistoryEntry")}} đại diện cho tất cả các mục lịch sử hiện có.
- {{domxref("Navigation.forward", "forward()")}}
  - : Điều hướng tiến tới một mục trong lịch sử điều hướng.
- {{domxref("Navigation.navigate", "navigate()")}}
  - : Điều hướng đến một URL cụ thể, cập nhật bất kỳ trạng thái nào được cung cấp trong danh sách mục lịch sử.
- {{domxref("Navigation.reload", "reload()")}}
  - : Tải lại URL hiện tại, cập nhật bất kỳ trạng thái nào được cung cấp trong danh sách mục lịch sử.
- {{domxref("Navigation.traverseTo", "traverseTo()")}}
  - : Điều hướng đến một {{domxref("NavigationHistoryEntry")}} cụ thể được xác định bằng {{domxref("NavigationHistoryEntry.key", "key")}}.
- {{domxref("Navigation.updateCurrentEntry", "updateCurrentEntry()")}}
  - : Cập nhật trạng thái của {{domxref("Navigation.currentEntry","currentEntry")}}; được dùng
    trong các trường hợp thay đổi trạng thái độc lập với một điều hướng hoặc tải lại.

## Sự kiện

_Kế thừa sự kiện từ giao diện cha, {{DOMxRef("EventTarget")}}._

- {{domxref("Navigation/currententrychange_event", "currententrychange")}}
  - : Phát ra khi {{domxref("Navigation.currentEntry")}} đã thay đổi.
- {{domxref("Navigation/navigate_event", "navigate")}}
  - : Phát ra khi [bất kỳ loại điều hướng nào](https://github.com/WICG/navigation-api#appendix-types-of-navigations) được khởi tạo, cho phép bạn chặn khi cần.
- {{domxref("Navigation/navigateerror_event", "navigateerror")}}
  - : Phát ra khi một điều hướng thất bại.
- {{domxref("Navigation/navigatesuccess_event", "navigatesuccess")}}
  - : Phát ra khi một điều hướng thành công đã hoàn tất.

## Ví dụ

### Di chuyển tiến và lùi trong lịch sử

```js
async function backHandler() {
  if (navigation.canGoBack) {
    await navigation.back().finished;
    // Handle any required clean-up after
    // navigation has finished
  } else {
    displayBanner("You are on the first page");
  }
}

async function forwardHandler() {
  if (navigation.canGoForward) {
    await navigation.forward().finished;
    // Handle any required clean-up after
    // navigation has finished
  } else {
    displayBanner("You are on the last page");
  }
}
```

### Duyệt tới một mục lịch sử cụ thể

```js
// On JS startup, get the key of the first loaded page
// so the user can always go back there.
const { key } = navigation.currentEntry;
backToHomeButton.onclick = () => navigation.traverseTo(key);

// Navigate away, but the button will always work.
await navigation.navigate("/another_url").finished;
```

### Điều hướng và cập nhật trạng thái

```js
navigation.navigate(url, { state: newState });
```

Hoặc

```js
navigation.reload({ state: newState });
```

Hoặc nếu trạng thái độc lập với một điều hướng hoặc tải lại:

```js
navigation.updateCurrentEntry({ state: newState });
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
- [Navigation API live demo](https://mdn.github.io/dom-examples/navigation-api/) ([view demo source](https://github.com/mdn/dom-examples/tree/main/navigation-api))
