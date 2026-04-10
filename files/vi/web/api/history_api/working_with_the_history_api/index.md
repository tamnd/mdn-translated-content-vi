---
title: Làm việc với History API
slug: Web/API/History_API/Working_with_the_History_API
page-type: guide
---

{{DefaultAPISidebar("History API")}}

History API cho phép một website tương tác với lịch sử phiên của trình duyệt: tức là danh sách các trang mà người dùng đã truy cập trong một cửa sổ nhất định. Khi người dùng truy cập các trang mới, ví dụ bằng cách nhấp vào liên kết, các trang mới đó sẽ được thêm vào lịch sử phiên. Người dùng cũng có thể di chuyển qua lại trong lịch sử bằng các nút "Back" và "Forward" của trình duyệt.

Giao diện chính được định nghĩa trong History API là giao diện {{domxref("History")}}, và giao diện này xác định hai nhóm phương thức rất khác nhau:

1. Các phương thức để điều hướng tới một trang trong lịch sử phiên:
   - {{domxref("History.back()")}}
   - {{domxref("History.forward()")}}
   - {{domxref("History.go()")}}

2. Các phương thức để sửa đổi lịch sử phiên:
   - {{domxref("History.pushState()")}}
   - {{domxref("History.replaceState()")}}

Trong hướng dẫn này, chúng ta chỉ đề cập đến nhóm phương thức thứ hai.

Phương thức `pushState()` thêm một mục mới vào lịch sử phiên, trong khi phương thức `replaceState()` cập nhật mục lịch sử của trang hiện tại. Cả hai phương thức này đều nhận một tham số `state` có thể chứa bất kỳ {{Glossary("Serializable_object", "đối tượng có thể tuần tự hóa")}} nào. Khi trình duyệt điều hướng đến mục lịch sử này, nó sẽ kích hoạt sự kiện {{domxref("Window.popstate_event", "popstate")}}, và sự kiện đó chứa đối tượng trạng thái được liên kết với mục ấy.

Mục đích chính của các API này là hỗ trợ những website như {{Glossary("SPA", "ứng dụng một trang")}}, vốn dùng các API JavaScript như {{domxref("Window/fetch", "fetch()")}} để cập nhật trang với nội dung mới thay vì tải cả một trang mới.

## Ứng dụng một trang và lịch sử phiên

Theo truyền thống, các website được triển khai như một tập hợp các trang. Khi người dùng điều hướng đến các phần khác nhau của site bằng cách nhấp vào liên kết, trình duyệt sẽ tải một trang hoàn toàn mới mỗi lần.

Mặc dù cách này rất phù hợp với nhiều site, nó cũng có một số nhược điểm:

- Có thể không hiệu quả khi phải tải cả trang mỗi lần, trong khi chỉ cần cập nhật một phần của trang.
- Khó duy trì trạng thái ứng dụng khi điều hướng qua các trang.

Vì những lý do này, một mẫu phổ biến cho web app là {{Glossary("SPA", "ứng dụng một trang")}} (SPA). Khi người dùng nhấp vào một liên kết, SPA sẽ thực hiện các bước sau:

1. Ngăn hành vi mặc định là tải một trang mới.
2. {{domxref("Window/fetch", "Fetches", "", "nocode")}} nội dung mới để hiển thị.
3. Cập nhật trang bằng nội dung mới.

Ví dụ:

```js
document.addEventListener("click", async (event) => {
  const creature = event.target.getAttribute("data-creature");
  if (creature) {
    // Ngăn việc tải một trang mới
    event.preventDefault();
    try {
      // Lấy nội dung mới
      const response = await fetch(`creatures/${creature}.json`);
      const result = await response.json();
      // Cập nhật trang bằng nội dung mới
      displayContent(result);
    } catch (err) {
      console.error(err);
    }
  }
});
```

Trong bộ xử lý click này, nếu liên kết chứa một thuộc tính dữ liệu `"data-creature"`, chúng ta sẽ dùng giá trị của thuộc tính đó để lấy một file JSON chứa nội dung mới cho trang.

File JSON có thể trông như sau:

```json
{
  "description": "Bald eagles are not actually bald.",
  "image": {
    "src": "images/eagle.jpg",
    "alt": "A bald eagle"
  },
  "name": "Eagle"
}
```

Hàm `displayContent()` của chúng ta sẽ cập nhật trang bằng JSON:

```js
// Cập nhật trang bằng nội dung mới
function displayContent(content) {
  document.title = `Creatures: ${content.name}`;

  const description = document.querySelector("#description");
  description.textContent = content.description;

  const photo = document.querySelector("#photo");
  photo.setAttribute("src", content.image.src);
  photo.setAttribute("alt", content.image.alt);
}
```

Vấn đề là cách làm này phá vỡ hành vi mong đợi của các nút "Back" và "Forward" của trình duyệt.

Từ góc nhìn của người dùng, họ đã nhấp vào một liên kết và trang được cập nhật, nên trông giống như đã mở một trang mới. Nếu sau đó họ nhấn nút "Back" của trình duyệt, họ kỳ vọng quay về trạng thái trước khi nhấp liên kết đó.

Nhưng xét từ phía trình duyệt, liên kết cuối cùng không tải một trang mới, nên "Back" sẽ đưa trình duyệt về trang đã được tải trước khi người dùng mở SPA.

Đây chính là vấn đề mà `pushState()`, `replaceState()` và sự kiện `popstate` giải quyết. Chúng cho phép chúng ta tạo ra các mục lịch sử mô phỏng, và được thông báo khi mục lịch sử phiên hiện tại chuyển sang một trong các mục này (ví dụ, vì người dùng nhấn nút "Back" hoặc "Forward").

## Sử dụng `pushState()`

Chúng ta có thể thêm một mục lịch sử vào bộ xử lý click ở trên như sau:

```js
document.addEventListener("click", async (event) => {
  const creature = event.target.getAttribute("data-creature");
  if (creature) {
    event.preventDefault();
    try {
      const response = await fetch(`creatures/${creature}.json`);
      const result = await response.json();
      displayContent(result);
      // Thêm một mục mới vào lịch sử.
      // Điều này mô phỏng việc tải một trang mới.
      history.pushState(result, "", creature);
    } catch (err) {
      console.error(err);
    }
  }
});
```

Ở đây, chúng ta gọi `pushState()` với ba đối số:

- `result`: Đây là nội dung vừa được lấy về. Nó sẽ được lưu cùng mục lịch sử, và sau đó được đưa vào thuộc tính {{domxref("PopStateEvent.state", "state")}} của đối số được truyền cho bộ xử lý sự kiện `popstate`.
- `""`: Tham số này cần có để tương thích ngược với các site cũ, và luôn nên là một chuỗi rỗng.
- `creature`: Giá trị này sẽ được dùng làm URL cho mục lịch sử. Nó sẽ được hiển thị trên thanh URL của trình duyệt, và sẽ được dùng làm giá trị của header {{httpheader("Referer")}} trong mọi yêu cầu HTTP mà trang thực hiện. Lưu ý rằng giá trị này phải cùng {{Glossary("Same-origin policy", "same-origin")}} với trang.

## Sử dụng sự kiện `popstate`

Giả sử người dùng thực hiện các bước sau:

1. Nhấp một liên kết trong SPA của chúng ta, vì vậy chúng ta cập nhật trang và thêm mục lịch sử A bằng `pushState()`.
2. Nhấp một liên kết khác trong SPA của chúng ta, vì vậy chúng ta cập nhật trang và thêm mục lịch sử B bằng `pushState()`.
3. Nhấn nút "Back".

Lúc này mục lịch sử hiện tại mới là A, nên trình duyệt sẽ kích hoạt sự kiện `popstate`, và đối số của bộ xử lý sự kiện sẽ bao gồm JSON mà chúng ta đã truyền cho `pushState()` khi xử lý việc điều hướng tới A. Điều này có nghĩa là chúng ta có thể khôi phục đúng nội dung bằng một bộ xử lý sự kiện như sau:

```js
// Xử lý nút tiến/lùi
window.addEventListener("popstate", (event) => {
  // Nếu có state được cung cấp, chúng ta có một trang "mô phỏng"
  // và sẽ cập nhật trang hiện tại.
  if (event.state) {
    // Mô phỏng việc tải trang trước đó
    displayContent(event.state);
  }
});
```

## Sử dụng `replaceState()`

Có thêm một phần nữa chúng ta cần bổ sung. Khi người dùng tải SPA, trình duyệt sẽ thêm một mục lịch sử. Vì đây là một lần tải trang thực sự, nên mục đó không có state đi kèm. Vậy giả sử người dùng làm như sau:

1. Tải SPA, vì vậy trình duyệt thêm một mục lịch sử.
2. Nhấp một liên kết bên trong SPA, vì vậy bộ xử lý click cập nhật trang và thêm một mục lịch sử bằng `pushState()`.
3. Nhấn nút "Back".

Bây giờ chúng ta muốn quay về trạng thái ban đầu của SPA, nhưng vì đây là một điều hướng trong cùng một tài liệu, trang sẽ không được tải lại, và vì mục lịch sử của trang ban đầu không có state, chúng ta không thể dùng `popstate` để khôi phục nó.

Giải pháp ở đây là dùng `replaceState()` để đặt đối tượng state cho trang ban đầu. Ví dụ:

```js
// Tạo state khi tải trang và thay thế lịch sử hiện tại bằng nó
const image = document.querySelector("#photo");
const initialState = {
  description: document.querySelector("#description").textContent,
  image: {
    src: image.getAttribute("src"),
    alt: image.getAttribute("alt"),
  },
  name: "Home",
};
history.replaceState(initialState, "", document.location.href);
```

Khi tải trang, chúng ta thu thập tất cả các phần của trang cần khôi phục khi người dùng quay về điểm bắt đầu của SPA. Cấu trúc này giống hệt JSON mà chúng ta lấy khi xử lý các điều hướng khác. Chúng ta truyền đối tượng `initialState` này vào `replaceState()`, và thao tác này về thực chất sẽ thêm đối tượng state vào mục lịch sử hiện tại.

Khi người dùng quay lại điểm bắt đầu của chúng ta, sự kiện `popstate` sẽ chứa state ban đầu này, và chúng ta có thể dùng hàm `displayContent()` để cập nhật trang.

## Ví dụ History API hoàn chỉnh

Bạn có thể tìm ví dụ hoàn chỉnh này tại <https://github.com/mdn/dom-examples/tree/main/history-api>, và xem demo trực tiếp tại <https://mdn.github.io/dom-examples/history-api/>.

## Xem thêm

- [History API](/en-US/docs/Web/API/History_API)
- Đối tượng toàn cục {{domxref("window.history", "history")}}
