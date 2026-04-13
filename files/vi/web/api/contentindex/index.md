---
title: ContentIndex
slug: Web/API/ContentIndex
page-type: web-api-interface
status:
  - experimental
browser-compat: api.ContentIndex
---

{{APIRef("Content Index API")}}{{SeeCompatTable}}{{AvailableInWorkers}}

Giao diện **`ContentIndex`** của [Content Index API](/en-US/docs/Web/API/Content_Index_API) cho phép nhà phát triển đăng ký nội dung có hỗ trợ ngoại tuyến của họ với trình duyệt.

## Thuộc tính thể hiện

Giao diện này không có thuộc tính nào.

## Phương thức thể hiện

- {{domxref('ContentIndex.add()')}} {{Experimental_Inline}}
  - : Đăng ký một mục với [chỉ mục nội dung](/en-US/docs/Web/API/Content_Index_API).
- {{domxref('ContentIndex.delete()')}} {{Experimental_Inline}}
  - : Hủy đăng ký một mục khỏi nội dung hiện đang được lập chỉ mục.
- {{domxref('ContentIndex.getAll()')}} {{Experimental_Inline}}
  - : Trả về một {{jsxref('Promise')}} được giải quyết với một danh sách có thể lặp các mục trong chỉ mục nội dung.

## Ví dụ

### Phát hiện tính năng và truy cập giao diện

Ở đây, chúng ta lấy tham chiếu đến {{domxref('ServiceWorkerRegistration')}}, rồi kiểm tra thuộc tính `index`, thuộc tính này cho phép truy cập giao diện chỉ mục nội dung.

```js
// tham chiếu registration
const registration = await navigator.serviceWorker.ready;

// phát hiện tính năng
if ("index" in registration) {
  // chức năng Content Index API
  const contentIndex = registration.index;
}
```

### Thêm vào chỉ mục nội dung

Ở đây, chúng ta khai báo một mục theo đúng định dạng và tạo một hàm bất đồng bộ dùng phương thức {{domxref('ContentIndex.add','add()')}} để đăng ký mục đó với [chỉ mục nội dung](/en-US/docs/Web/API/Content_Index_API).

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

// hàm bất đồng bộ để thêm nội dung được lập chỉ mục
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

### Lấy các mục trong chỉ mục hiện tại

Ví dụ bên dưới cho thấy một hàm bất đồng bộ lấy các mục trong [chỉ mục nội dung](/en-US/docs/Web/API/Content_Index_API) rồi lặp qua từng mục để xây dựng một danh sách cho giao diện.

```js
async function createReadingList() {
  // truy cập service worker registration
  const registration = await navigator.serviceWorker.ready;

  // lấy các mục trong chỉ mục
  const entries = await registration.index.getAll();

  // tạo phần tử chứa
  const readingListElem = document.createElement("div");

  // kiểm tra xem có mục nào không
  if (entries.length === 0) {
    // nếu không có mục nào, hiển thị thông báo
    const message = document.createElement("p");
    message.innerText =
      "You currently have no articles saved for offline reading.";

    readingListElem.append(message);
  } else {
    // nếu có mục, hiển thị chúng dưới dạng danh sách liên kết tới nội dung
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

### Hủy đăng ký nội dung đã lập chỉ mục

Bên dưới là một hàm bất đồng bộ xóa một mục khỏi [chỉ mục nội dung](/en-US/docs/Web/API/Content_Index_API).

```js
async function unregisterContent(article) {
  // tham chiếu registration
  const registration = await navigator.serviceWorker.ready;

  // phát hiện Content Index
  if (!registration.index) return;

  // hủy đăng ký nội dung khỏi chỉ mục
  await registration.index.delete(article.id);
}
```

Tất cả các phương thức trên đều có sẵn trong phạm vi của [service worker](/en-US/docs/Web/API/ServiceWorker). Có thể truy cập chúng từ thuộc tính {{domxref('WorkerGlobalScope.self')}}:

```js
// script service worker

self.registration.index.add(item);

self.registration.index.delete(item.id);

const contentIndexItems = self.registration.index.getAll();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Bài viết nhập môn về Content Index API](https://developer.chrome.com/docs/capabilities/web-apis/content-indexing-api)
- [Service Worker API cùng thông tin về Cache và CacheStorage](/en-US/docs/Web/API/Service_Worker_API)
