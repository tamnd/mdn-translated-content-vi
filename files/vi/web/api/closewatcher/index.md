---
title: CloseWatcher
slug: Web/API/CloseWatcher
page-type: web-api-interface
browser-compat: api.CloseWatcher
---

{{APIRef("HTML DOM")}}

Giao diện `CloseWatcher` cho phép một thành phần UI tùy chỉnh có ngữ nghĩa mở và đóng phản hồi với các thao tác đóng đặc thù theo thiết bị theo cùng cách như một thành phần dựng sẵn.

{{InheritanceDiagram}}

Giao diện `CloseWatcher` kế thừa từ {{domxref("EventTarget")}}.

## Bộ khởi tạo

- {{domxref("CloseWatcher.CloseWatcher", "CloseWatcher()")}}
  - : Tạo một thể hiện `CloseWatcher` mới.

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức từ giao diện cha của nó là {{domxref("EventTarget")}}._

- {{domxref("CloseWatcher.requestClose()")}}
  - : Kích hoạt một sự kiện `cancel` và nếu sự kiện đó không bị hủy bằng {{domxref("Event.preventDefault()")}}, sẽ tiếp tục kích hoạt một sự kiện `close`, rồi cuối cùng vô hiệu hóa close watcher như thể `destroy()` đã được gọi.
- {{domxref("CloseWatcher.close()")}}
  - : Kích hoạt ngay sự kiện `close`, mà không kích hoạt `cancel` trước, và vô hiệu hóa close watcher như thể `destroy()` đã được gọi.
- {{domxref("CloseWatcher.destroy()")}}
  - : Vô hiệu hóa close watcher để nó không còn nhận các sự kiện `close` nữa.

## Sự kiện

- {{domxref("CloseWatcher.cancel_event", "cancel")}}
  - : Một sự kiện được kích hoạt trước sự kiện `close`, để có thể ngăn `close` được kích hoạt.
- {{domxref("CloseWatcher.close_event", "close")}}
  - : Một sự kiện được kích hoạt khi nhận được yêu cầu đóng.

## Mô tả

Một số thành phần UI có "hành vi đóng", nghĩa là thành phần xuất hiện và người dùng có thể đóng nó khi đã dùng xong. Ví dụ: thanh bên, popup, hộp thoại hoặc thông báo.

Người dùng thường mong đợi có thể dùng một cơ chế nhất định để đóng các phần tử này, và cơ chế đó có xu hướng phụ thuộc vào thiết bị. Ví dụ, trên thiết bị có bàn phím thì đó có thể là phím <kbd>Esc</kbd>, nhưng trên Android có thể là nút quay lại. Với các thành phần dựng sẵn, chẳng hạn như [popover](/en-US/docs/Web/API/Popover_API) hoặc phần tử {{htmlelement("dialog")}}, trình duyệt sẽ tự xử lý các khác biệt này, đóng phần tử khi người dùng thực hiện thao tác đóng phù hợp với thiết bị. Tuy nhiên, khi nhà phát triển web tự triển khai thành phần UI có thể đóng của riêng mình (ví dụ, một thanh bên), việc triển khai kiểu hành vi đóng đặc thù theo thiết bị này là khá khó.

Giao diện `CloseWatcher` giải quyết vấn đề này bằng cách phát ra sự kiện `cancel`, rồi sau đó là sự kiện `close`, khi người dùng thực hiện thao tác đóng đặc thù theo thiết bị.
Ứng dụng web có thể dùng trình xử lý `onclose` để đóng phần tử UI khi phản hồi với sự kiện đặc thù theo thiết bị.
Chúng cũng có thể kích hoạt chính các sự kiện này để phản hồi với cơ chế đóng thông thường của phần tử UI, rồi triển khai xử lý sự kiện `close` chung cho cả thao tác đóng do ứng dụng và thao tác đóng đặc thù theo thiết bị.
Sau khi trình xử lý sự kiện `onclose` hoàn tất, `CloseWatcher` sẽ bị hủy và các sự kiện sẽ không còn được kích hoạt nữa.

Trong một số ứng dụng, phần tử UI có thể chỉ được phép đóng khi ở trong một trạng thái nhất định; ví dụ, khi một số thông tin cần thiết đã được điền.
Để xử lý các trường hợp này, ứng dụng có thể ngăn không cho sự kiện `close` được phát ra bằng cách triển khai trình xử lý cho sự kiện `cancel` gọi {{domxref("Event.preventDefault()")}} nếu phần tử UI chưa sẵn sàng để đóng.

Bạn có thể tạo các thể hiện `CloseWatcher` mà không cần [kích hoạt người dùng](/en-US/docs/Web/Security/Defenses/User_activation), và điều này hữu ích để triển khai các trường hợp như hộp thoại hết thời gian chờ do không hoạt động trong phiên. Tuy nhiên, nếu bạn tạo nhiều hơn một `CloseWatcher` mà không có kích hoạt người dùng, thì các watcher sẽ được nhóm lại, vì vậy một yêu cầu đóng duy nhất sẽ đóng cả hai.
Ngoài ra, close watcher đầu tiên không nhất thiết phải là một đối tượng `CloseWatcher`: nó có thể là một phần tử hộp thoại modal, hoặc một popover được tạo bởi phần tử có thuộc tính `popover`

## Ví dụ

### Xử lý yêu cầu đóng

Trong ví dụ này, bạn có một thành phần UI của riêng mình (một picker) và bạn muốn hỗ trợ cả phương thức đóng mặc định của nền tảng (ví dụ: phím <kbd>Esc</kbd>) lẫn phương thức đóng tùy chỉnh của bạn (một nút đóng).

Bạn tạo một `CloseWatcher` để xử lý tất cả các sự kiện `close`.

Trình xử lý `onclick` của thành phần UI có thể gọi `requestClose` để yêu cầu đóng và định tuyến yêu cầu đóng của bạn qua cùng trình xử lý `onclose` mà phương thức đóng của nền tảng sử dụng.

```js
const watcher = new CloseWatcher();
const picker = setUpAndShowPickerDOMElement();
let chosenValue = null;

watcher.onclose = () => {
  chosenValue = picker.querySelector("input").value;
  picker.remove();
};

picker.querySelector(".close-button").onclick = () => watcher.requestClose();
```

### Đóng thanh bên bằng yêu cầu đóng của nền tảng

Trong ví dụ này, chúng ta có một thành phần thanh bên được hiển thị khi nút "Open" được chọn, và được ẩn bằng nút "Close" hoặc các cơ chế gốc của nền tảng.
Để ví dụ thú vị hơn, đây là một ví dụ trực tiếp!

Lưu ý thêm rằng ví dụ này hơi gượng ép, vì thông thường chúng ta sẽ dùng một nút chuyển đổi để thay đổi trạng thái của thanh bên.
Chắc chắn chúng ta có thể làm như vậy, nhưng việc dùng riêng nút "Open" và "Close" giúp minh họa tính năng dễ hơn.

#### HTML

Phần HTML định nghĩa các phần tử {{htmlelement("button")}} "Open" và "Close", cùng với các phần tử {{htmlelement("div")}} cho nội dung chính và thanh bên.
CSS được dùng để tạo hiệu ứng hiển thị cho phần tử thanh bên khi lớp `open` được thêm hoặc xóa khỏi các phần tử thanh bên và nội dung (phần CSS này được ẩn vì không liên quan đến ví dụ).

```html
<button id="sidebar-open" type="button">Open</button>
<button id="sidebar-close" type="button">Close</button>
<div class="sidebar">Sidebar</div>
<div class="main-content">Main content</div>
```

```css hidden
.sidebar {
  position: fixed;
  top: 20px;
  left: -300px;
  right: auto;
  bottom: 0;
  width: 300px; /* Adjust the width as needed */
  background-color: lightblue;
}

.main-content {
  position: fixed;
  top: 20px;
  left: 0;
  right: 0;
  bottom: 0;
  width: auto; /* Adjust the width as needed */
  background-color: green;
  margin-left: 0px; /* Adjust for the sidebar width */
}

.sidebar.open {
  left: 0; /* Slide the sidebar to the right when open */
  transition: left 0.3s ease-in-out; /* Add a smooth transition effect */
}

.main-content.open {
  margin-left: 300px; /* Adjust for the sidebar width */
  transition: margin-left 0.3s ease-in-out;
  background-color: green;
}
```

#### JavaScript

Mã trước tiên lấy các biến cho các nút và phần tử `<div>` được định nghĩa trong HTML.
Mã cũng định nghĩa một hàm `closeSidebar()` được gọi khi thanh bên đóng lại để xóa lớp `open` khỏi các phần tử `<div>`, và thêm một trình nghe sự kiện `click` gọi phương thức `openSidebar()` khi nút "Open" được nhấn.

```js
const sidebar = document.querySelector(".sidebar");
const mainContent = document.querySelector(".main-content");
const sidebarOpen = document.getElementById("sidebar-open");
const sidebarClose = document.getElementById("sidebar-close");

function closeSidebar() {
  sidebar.classList.remove("open");
  mainContent.classList.remove("open");
}

sidebarOpen.addEventListener("click", openSidebar);
```

Phần triển khai của `openSidebar()` được đưa ra bên dưới.
Phương thức này trước tiên kiểm tra xem thanh bên đã mở hay chưa, và nếu chưa thì thêm lớp `open` vào các phần tử để thanh bên được hiển thị.

Sau đó, chúng ta tạo một `CloseWatcher` mới và thêm một trình nghe sẽ gọi {{domxref("CloseWatcher.close()", "close()")}} trên nó nếu nút "Close" được nhấn.
Điều này đảm bảo sự kiện `close` được gọi khi dùng cơ chế đóng gốc của nền tảng hoặc nút "Close".
Việc triển khai trình xử lý sự kiện `onclose()` chỉ đơn giản là đóng thanh bên, và `CloseWatcher` sau đó sẽ tự động bị hủy.

```js
function openSidebar() {
  if (!sidebar.classList.contains("open")) {
    sidebar.classList.add("open");
    mainContent.classList.add("open");

    // Add new CloseWatcher
    const watcher = new CloseWatcher();

    sidebarClose.addEventListener("click", () => watcher.close());

    // Handle close event, invoked by platform mechanisms or "Close" button
    watcher.onclose = () => {
      closeSidebar();
    };
  }
}
```

Lưu ý rằng chúng ta chọn gọi `close()` trên watcher thay vì {{domxref("CloseWatcher.requestClose()")}} vì chúng ta không cần sự kiện `cancel` được phát ra (chúng ta sẽ dùng `requestClose()` và trình xử lý sự kiện `cancel` nếu có lý do cần ngăn thanh bên đóng quá sớm).

#### Kết quả

Chọn nút "Open" để mở thanh bên. Bạn sẽ có thể đóng thanh bên bằng nút "Close" hoặc phương thức quen thuộc của nền tảng, chẳng hạn phím <kbd>Esc</kbd> trên Windows.

{{ EmbedLiveSample("Closing a sidebar using a platform close request", "100%", "200") }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("HTMLDialogElement.close_event", "close")}} trên {{domxref("HTMLDialogElement")}}
