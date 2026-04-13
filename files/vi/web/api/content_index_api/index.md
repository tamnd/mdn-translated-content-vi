---
title: Content Index API
slug: Web/API/Content_Index_API
page-type: web-api-overview
status:
  - experimental
browser-compat:
  - api.ContentIndex
  - api.ServiceWorkerRegistration.index
spec-urls: https://wicg.github.io/content-index/spec/
---

{{DefaultAPISidebar("Content Index API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

**Content Index API** cho phép các nhà phát triển đăng ký nội dung có hỗ trợ ngoại tuyến của họ với trình duyệt.

## Khái niệm và cách sử dụng

Ở trạng thái hiện tại, nội dung web ngoại tuyến không dễ để người dùng khám phá. Lập chỉ mục nội dung cho phép các nhà phát triển cho trình duyệt biết về nội dung ngoại tuyến cụ thể của họ. Điều này cho phép người dùng khám phá và xem những gì hiện có, đồng thời trao cho nhà phát triển khả năng thêm và quản lý nội dung này. Ví dụ có thể là một trang web tin tức tải trước các bài viết mới nhất trong nền, hoặc một ứng dụng phát trực tuyến nội dung đăng ký phần nội dung đã tải xuống.

Content Index API là một phần mở rộng của [service worker](/en-US/docs/Web/API/Service_Worker_API), cho phép các nhà phát triển thêm URL và metadata của các trang đã được lưu trong bộ nhớ đệm, trong phạm vi của service worker hiện tại. Sau đó, trình duyệt có thể sử dụng các mục này để hiển thị nội dung đọc ngoại tuyến cho người dùng. Với tư cách là nhà phát triển, bạn cũng có thể hiển thị các mục này bên trong ứng dụng của mình.

Các mục đã được lập chỉ mục không tự động hết hạn. Bạn nên cung cấp một giao diện để xóa các mục, hoặc định kỳ loại bỏ các mục cũ hơn.

> [!NOTE]
> API hỗ trợ lập chỉ mục các URL tương ứng với tài liệu HTML. Ví dụ, URL của một tệp media đã được lưu trong bộ nhớ đệm không thể được lập chỉ mục trực tiếp. Thay vào đó, bạn cần cung cấp URL cho một trang hiển thị media và hoạt động được khi ngoại tuyến.

## Giao diện

- {{domxref("ContentIndex")}} {{Experimental_Inline}}
  - : Cung cấp chức năng đăng ký nội dung khả dụng khi ngoại tuyến.
- {{domxref("ContentIndexEvent")}} {{Experimental_Inline}}
  - : Định nghĩa đối tượng dùng để biểu diễn sự kiện {{domxref("ServiceWorkerGlobalScope.contentdelete_event", "contentdelete")}}.

### Phần mở rộng cho các giao diện khác

Các bổ sung sau đây cho {{domxref('ServiceWorker')}} đã được đặc tả trong Content Index API để cung cấp điểm truy cập cho việc sử dụng lập chỉ mục nội dung.

- {{domxref("ServiceWorkerRegistration.index")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tham chiếu đến giao diện {{domxref("ContentIndex")}} để lập chỉ mục các trang đã được lưu trong bộ nhớ đệm.
- Sự kiện {{domxref("ServiceWorkerGlobalScope.contentdelete_event", "contentdelete")}} {{Experimental_Inline}}
  - : Được kích hoạt khi nội dung bị tác nhân người dùng xóa.

## Ví dụ

Tất cả các ví dụ sau đây đều giả định rằng một service worker đã được đăng ký. Để biết thêm thông tin, xem [Service Worker API](/en-US/docs/Web/API/Service_Worker_API).

### Phát hiện tính năng và truy cập giao diện

Ở đây chúng ta lấy tham chiếu đến {{domxref('ServiceWorkerRegistration')}}, sau đó kiểm tra thuộc tính `index`, thuộc tính này cho phép chúng ta truy cập giao diện content index.

```js
// tham chiếu đến registration
const registration = await navigator.serviceWorker.ready;

// phát hiện tính năng
if ("index" in registration) {
  // Chức năng của Content Index API
  const contentIndex = registration.index;
}
```

### Thêm vào content index

Ở đây chúng ta khai báo một mục theo đúng định dạng và tạo một hàm bất đồng bộ sử dụng phương thức {{domxref('ContentIndex.add','add()')}} để đăng ký mục đó với content index.

```js
// nội dung của chúng ta
const item = {
  id: "post-1",
  url: "/posts/amet.html",
  title: "Amet consectetur adipisicing",
  description:
    "Repellat et quia iste possimus ducimus aliquid a aut eaque nostrum.",
  icons: [
    {
      src: "/media/dark.png",
      sizes: "128x128",
      type: "image/png",
    },
  ],
  category: "article",
};

// hàm bất đồng bộ để thêm nội dung đã được lập chỉ mục
async function registerContent(data) {
  const registration = await navigator.serviceWorker.ready;

  // phát hiện Content Index
  if (!registration.index) {
    return;
  }

  // đăng ký nội dung
  try {
    await registration.index.add(data);
  } catch (e) {
    console.log("Failed to register content: ", e.message);
  }
}
```

### Truy xuất các mục trong chỉ mục hiện tại

Ví dụ dưới đây cho thấy một hàm bất đồng bộ truy xuất các mục trong content index và lặp qua từng mục nhập, xây dựng một danh sách cho giao diện.

```js
async function createReadingList() {
  // truy cập service worker registration của chúng ta
  const registration = await navigator.serviceWorker.ready;

  // lấy các mục trong chỉ mục
  const entries = await registration.index.getAll();

  // tạo phần tử bao chứa
  const readingListElem = document.createElement("div");

  // kiểm tra các mục nhập
  if (entries.length === 0) {
    // nếu không có mục nào, hiển thị thông báo
    const message = document.createElement("p");
    message.innerText =
      "You currently have no articles saved for offline reading.";

    readingListElem.append(message);
  } else {
    // nếu có các mục nhập, hiển thị chúng trong danh sách liên kết tới nội dung
    const listElem = document.createElement("ul");

    for (const entry of entries) {
      const listItem = document.createElement("li");

      const anchorElem = document.createElement("a");
      anchorElem.innerText = entry.title;
      anchorElem.setAttribute("href", entry.url);

      listElem.append(listItem);
    }

    readingListElem.append(listElem);
  }
}
```

### Hủy đăng ký nội dung đã được lập chỉ mục

Dưới đây là một hàm bất đồng bộ dùng để xóa một mục khỏi content index.

```js
async function unregisterContent(article) {
  // tham chiếu đến registration
  const registration = await navigator.serviceWorker.ready;

  // phát hiện Content Index
  if (!registration.index) return;

  // hủy đăng ký nội dung khỏi chỉ mục
  await registration.index.delete(article.id);
}
```

Tất cả các phương thức ở trên đều khả dụng trong phạm vi của [service worker](/en-US/docs/Web/API/ServiceWorker). Chúng có thể truy cập được từ thuộc tính {{domxref('WorkerGlobalScope.self')}}:

```js
// script service worker

self.registration.index.add(item);

self.registration.index.delete(item.id);

const contentIndexItems = self.registration.index.getAll();
```

### Sự kiện contentdelete

Khi một mục bị xóa khỏi giao diện tác nhân người dùng, service worker sẽ nhận được một sự kiện `contentdelete`.

```js
self.addEventListener("contentdelete", (event) => {
  console.log(event.id);

  // ghi lại id của content index, sau đó có thể dùng để xác định nội dung nào cần xóa khỏi bộ nhớ đệm của bạn
});
```

Sự kiện {{domxref('ServiceWorkerGlobalScope.contentdelete_event', "contentdelete")}} chỉ được kích hoạt khi việc xóa xảy ra do tương tác với giao diện người dùng tích hợp sẵn của trình duyệt. Nó không được kích hoạt khi phương thức {{domxref('ContentIndex.delete()')}} được gọi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Bài viết giới thiệu về Content Index API](https://developer.chrome.com/docs/capabilities/web-apis/content-indexing-api)
- [Service Worker API, cùng với thông tin về Cache và CacheStorage](/en-US/docs/Web/API/Service_Worker_API)
