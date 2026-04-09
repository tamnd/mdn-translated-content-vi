---
title: "js13kGames: Tải tiến bộ"
short-title: Tải tiến bộ
slug: Web/Progressive_web_apps/Tutorials/js13kGames/Loading
page-type: guide
sidebar: pwasidebar
---

{{PreviousMenu("Web/Progressive_web_apps/Tutorials/js13kGames/Re-engageable_Notifications_Push", "Web/Progressive_web_apps/Tutorials/js13kGames")}}

Trong các bước trước của hướng dẫn này, chúng ta đã đề cập tới các API giúp biến ví dụ [js13kPWA](https://mdn.github.io/pwa-examples/js13kpwa/) thành một Progressive Web App bằng [Service Workers](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/Offline_Service_workers), [Web Manifests](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/Installable_PWAs), và [Notifications and Push](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/Re-engageable_Notifications_Push). Trong bài viết này, chúng ta sẽ đi xa hơn và cải thiện hiệu năng ứng dụng bằng cách tải tài nguyên theo tiến trình.

## Lần vẽ có ý nghĩa đầu tiên

Điều quan trọng là phải cung cấp cho người dùng điều gì đó có ý nghĩa càng sớm càng tốt - họ càng phải đợi trang tải lâu, khả năng họ rời đi trước khi mọi thứ tải xong càng lớn. Chúng ta nên có thể cho họ thấy ít nhất là khung nhìn cơ bản của trang họ muốn xem, với các placeholder ở những vị trí mà sau này nội dung sẽ được tải thêm.

Điều này có thể đạt được bằng progressive loading - còn được gọi là [Lazy loading](https://en.wikipedia.org/wiki/Lazy_loading). Mấu chốt là hoãn tải càng nhiều tài nguyên càng tốt (HTML, CSS, JavaScript), và chỉ tải ngay những gì thực sự cần cho trải nghiệm đầu tiên.

## Gộp so với tách nhỏ

Nhiều khách truy cập sẽ không đi qua mọi trang của một website, nhưng cách làm phổ biến là gộp toàn bộ tính năng vào một file lớn. Một file `bundle.js` có thể lớn tới nhiều megabyte, và một bundle `style.css` duy nhất có thể chứa mọi thứ từ các định nghĩa cấu trúc CSS cơ bản đến toàn bộ kiểu của mọi phiên bản site: mobile, tablet, desktop, chỉ in, v.v.

Tải toàn bộ thông tin đó dưới dạng một file lớn sẽ nhanh hơn nhiều file nhỏ, nhưng nếu người dùng không cần mọi thứ ngay từ đầu, chúng ta có thể chỉ tải phần quan trọng nhất rồi xử lý các tài nguyên khác khi cần.

## Tài nguyên chặn render

Gộp lại là một vấn đề, vì trình duyệt phải tải HTML, CSS và JavaScript trước khi có thể vẽ kết quả render lên màn hình. Trong vài giây từ lúc truy cập website đến lúc tải xong, người dùng chỉ thấy một trang trắng, đó là một trải nghiệm tệ.

Để khắc phục, chẳng hạn chúng ta có thể thêm `defer` vào file JavaScript:

```html
<script src="app.js" defer></script>
```

Chúng sẽ được tải xuống và thực thi _sau_ khi chính tài liệu đã được phân tích xong, nên sẽ không chặn việc render cấu trúc HTML.

Một kỹ thuật khác là tải JavaScript module bằng [dynamic import](/en-US/docs/Web/JavaScript/Reference/Operators/import) chỉ khi cần.

Ví dụ, nếu một website có nút tìm kiếm, chúng ta có thể tải JavaScript cho chức năng tìm kiếm sau khi người dùng nhấp nút tìm kiếm:

```js
document.getElementById("open-search").addEventListener("click", async () => {
  const searchModule = await import("/modules/search.js");
  searchModule.loadAutoComplete();
});
```

Khi người dùng nhấp nút, async click handler được gọi. Hàm sẽ đợi đến khi module tải xong, rồi gọi hàm `loadAutoComplete()` được export từ module đó. Vì vậy, `search.js` chỉ được tải, phân tích và thực thi khi tương tác thực sự xảy ra.

Chúng ta cũng có thể tách file CSS và thêm media types cho chúng:

```html
<link rel="stylesheet" href="style.css" />
<link rel="stylesheet" href="print.css" media="print" />
```

Điều này sẽ bảo trình duyệt chỉ tải chúng khi điều kiện tương ứng được đáp ứng.

Trong app demo js13kPWA của chúng ta, CSS đủ đơn giản để giữ tất cả trong một file mà không cần quy tắc đặc biệt nào về cách tải. Chúng ta thậm chí có thể đi xa hơn và chuyển mọi thứ từ `style.css` vào thẻ `<style>` trong `<head>` của `index.html` - điều đó sẽ cải thiện hiệu năng hơn nữa, nhưng để dễ đọc ví dụ, chúng ta cũng sẽ bỏ qua cách đó.

## Hình ảnh

Ngoài JavaScript và CSS, website thường sẽ chứa một số lượng lớn hình ảnh. Khi bạn thêm các phần tử {{htmlelement("img")}} vào HTML, mọi hình ảnh được tham chiếu sẽ được tải xuống trong lần truy cập website ban đầu. Không lạ gì khi phải tải hàng megabyte dữ liệu ảnh trước khi thông báo site đã sẵn sàng, nhưng điều này lại tạo cảm giác hiệu năng rất tệ. Chúng ta không cần tất cả hình ảnh ở chất lượng cao nhất ngay từ những giây đầu xem site.

Điều này có thể được tối ưu. Trước hết, bạn nên dùng các công cụ hoặc dịch vụ giống [TinyPNG](https://tinypng.com/) để giảm kích thước file ảnh mà không làm giảm chất lượng quá nhiều. Nếu đã làm xong điều đó, bạn có thể nghĩ đến tối ưu tải ảnh bằng JavaScript. Chúng ta sẽ giải thích điều đó dưới đây.

### Ảnh giữ chỗ

Thay vì đặt tất cả ảnh chụp màn hình game vào thuộc tính `src` của phần tử `<img>`, điều sẽ buộc trình duyệt tải chúng tự động, chúng ta có thể tải có chọn lọc bằng JavaScript. Ứng dụng js13kPWA dùng một ảnh giữ chỗ nhỏ và nhẹ, trong khi đường dẫn cuối cùng tới ảnh đích được lưu trong thuộc tính `data-src`:

```html
<img src="data/img/placeholder.png" data-src="data/img/SLUG.jpg" alt="NAME" />
```

Những ảnh đó sẽ được tải bằng JavaScript _sau_ khi site xây dựng xong cấu trúc HTML. Ảnh giữ chỗ được scale giống như ảnh gốc, nên sẽ chiếm cùng không gian và không làm bố cục phải vẽ lại khi ảnh tải xong.

### Tải qua JavaScript

File `app.js` xử lý các thuộc tính `data-src` như sau:

```js
let imagesToLoad = document.querySelectorAll("img[data-src]");
const loadImages = (image) => {
  image.setAttribute("src", image.getAttribute("data-src"));
  image.onload = () => {
    image.removeAttribute("data-src");
  };
};
```

Biến `imagesToLoad` chứa tham chiếu tới tất cả hình ảnh, còn hàm `loadImages` chuyển đường dẫn từ `data-src` sang `src`. Khi từng hình ảnh thực sự được tải, chúng ta xóa thuộc tính `data-src` vì nó không còn cần nữa. Sau đó chúng ta lặp qua từng hình ảnh và tải nó:

```js
imagesToLoad.forEach((img) => {
  loadImages(img);
});
```

### Làm mờ bằng CSS

Để toàn bộ quá trình trông hấp dẫn hơn về mặt thị giác, ảnh giữ chỗ được làm mờ trong CSS.

![Ảnh chụp các ảnh giữ chỗ trong ứng dụng js13kPWA.](js13kpwa-placeholders.png)

Chúng ta render ảnh với độ mờ ở đầu, để sau đó có thể chuyển sang ảnh sắc nét:

```css
article img[data-src] {
  filter: blur(0.2em);
}

article img {
  filter: blur(0em);
  transition: filter 0.5s;
}
```

Điều này sẽ xóa hiệu ứng mờ trong nửa giây, đủ đẹp cho hiệu ứng "đang tải".

## Tải theo nhu cầu

Cơ chế tải ảnh được bàn ở phần trên hoạt động ổn - nó tải ảnh sau khi render cấu trúc HTML, và áp dụng hiệu ứng chuyển tiếp đẹp mắt trong quá trình đó. Vấn đề là nó vẫn tải _tất cả_ ảnh cùng lúc, dù khi trang vừa tải người dùng chỉ thấy hai hoặc ba ảnh đầu tiên.

Vấn đề này có thể được giải quyết bằng cách chỉ tải ảnh khi cần: đó gọi là _lazy loading_. [Lazy loading](/en-US/docs/Web/Performance/Guides/Lazy_loading) là kỹ thuật chỉ tải ảnh khi chúng xuất hiện trong viewport. Có nhiều cách để bảo trình duyệt lazy load ảnh.

### Thuộc tính loading trên `<img>`

Cách dễ nhất để bảo trình duyệt tải chậm không cần JavaScript. Bạn thêm thuộc tính [`loading`](/en-US/docs/Web/HTML/Reference/Elements/img#loading) vào phần tử {{HTMLElement("img")}} với giá trị `lazy`, và trình duyệt sẽ hiểu chỉ tải ảnh đó khi cần.

```html
<img
  src="data/img/placeholder.png"
  data-src="data/img/SLUG.jpg"
  alt="NAME"
  loading="lazy" />
```

### Intersection Observer

Đây là một bước nâng cấp dần cho ví dụ vốn đã hoạt động - [Intersection Observer](/en-US/docs/Web/API/Intersection_Observer_API) sẽ chỉ tải ảnh đích khi người dùng cuộn xuống, làm chúng hiển thị trong viewport.

Đây là đoạn code liên quan:

```js
if ("IntersectionObserver" in window) {
  const observer = new IntersectionObserver((items, observer) => {
    items.forEach((item) => {
      if (item.isIntersecting) {
        loadImages(item.target);
        observer.unobserve(item.target);
      }
    });
  });
  imagesToLoad.forEach((img) => {
    observer.observe(img);
  });
} else {
  imagesToLoad.forEach((img) => {
    loadImages(img);
  });
}
```

Nếu đối tượng {{domxref("IntersectionObserver")}} được hỗ trợ, ứng dụng sẽ tạo một instance mới. Hàm được truyền như tham số sẽ xử lý trường hợp một hay nhiều item đang giao nhau với observer (tức là đang xuất hiện bên trong viewport). Chúng ta có thể lặp qua từng trường hợp và phản hồi tương ứng - khi hình ảnh trở nên nhìn thấy được, chúng ta tải ảnh đúng và ngừng quan sát nó vì không cần theo dõi nó nữa.

Hãy nhắc lại ý về progressive enhancement - code được viết để ứng dụng hoạt động dù Intersection Observer có được hỗ trợ hay không. Nếu không có, chúng ta chỉ tải ảnh theo cách cơ bản hơn đã nói trước đó.

## Cải tiến

Hãy nhớ rằng có nhiều cách để tối ưu thời gian tải, và ví dụ này chỉ đang khám phá một trong số đó. Bạn có thể làm ứng dụng chắc chắn hơn bằng cách làm cho nó chạy được mà không cần JavaScript - либо dùng {{htmlelement("noscript")}} để hiển thị ảnh với `src` cuối cùng đã được gán sẵn, hoặc bọc các thẻ `<img>` bằng phần tử {{htmlelement("a")}} trỏ tới ảnh đích, để người dùng có thể nhấp và truy cập chúng khi muốn.

Chúng ta sẽ không làm vậy vì bản thân ứng dụng phụ thuộc vào JavaScript - không có nó, danh sách game thậm chí còn không được tải, và code của Service Worker cũng sẽ không chạy.

Chúng ta có thể viết lại quy trình tải để không chỉ tải ảnh mà còn tải toàn bộ mục gồm mô tả đầy đủ và liên kết. Nó sẽ hoạt động như infinite scroll - chỉ tải các mục trong danh sách khi người dùng cuộn trang xuống. Như vậy cấu trúc HTML ban đầu sẽ tối thiểu hơn, thời gian tải còn nhỏ hơn, và chúng ta sẽ có lợi ích hiệu năng lớn hơn nữa.

## Kết luận

Ít file hơn cần tải ban đầu, file nhỏ hơn được tách thành module, dùng ảnh giữ chỗ, và tải thêm nội dung theo nhu cầu - tất cả điều này giúp đạt thời gian tải ban đầu nhanh hơn, mang lại lợi ích cho người tạo app và đem đến trải nghiệm mượt hơn cho người dùng.

Hãy nhớ cách tiếp cận progressive enhancement - cung cấp một sản phẩm dùng được trên mọi thiết bị hay nền tảng, nhưng cũng làm giàu trải nghiệm cho những ai dùng trình duyệt hiện đại.

## Suy nghĩ cuối cùng

Vậy là hết loạt hướng dẫn này - chúng ta đã đi qua [mã nguồn của ứng dụng mẫu js13kPWA](https://github.com/mdn/pwa-examples/tree/main/js13kpwa) và tìm hiểu về [cấu trúc PWA](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/App_structure), [khả dụng ngoại tuyến với Service Worker](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/Offline_Service_workers), [PWA có thể cài đặt](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/Installable_PWAs), và cuối cùng là [thông báo](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/Re-engageable_Notifications_Push).

Và trong bài viết này, chúng ta đã xem khái niệm tải tiến bộ, bao gồm một ví dụ thú vị dùng [Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API).

Hãy thoải mái thử nghiệm với code, nâng cấp ứng dụng hiện có của bạn bằng các tính năng PWA, hoặc tự xây một thứ hoàn toàn mới. PWA đem lại lợi thế rất lớn so với web app thông thường.

{{PreviousMenu("Web/Progressive_web_apps/Tutorials/js13kGames/Re-engageable_Notifications_Push", "Web/Progressive_web_apps/Tutorials/js13kGames")}}
