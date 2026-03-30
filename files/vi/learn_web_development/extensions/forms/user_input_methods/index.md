---
title: Phương thức và điều khiển đầu vào người dùng
short-title: UI methods & controls
slug: Learn_web_development/Extensions/Forms/User_input_methods
page-type: guide
sidebar: learnsidebar
---

Biểu mẫu web yêu cầu đầu vào người dùng. Khi thiết kế biểu mẫu web, hoặc thực sự bất kỳ nội dung web nào, điều quan trọng là xem xét cách người dùng tương tác với thiết bị và trình duyệt của họ. Đầu vào người dùng web vượt ra ngoài chuột và bàn phím đơn giản: hãy nghĩ đến màn hình cảm ứng chẳng hạn.

Trong bài viết này, chúng ta xem xét các cách khác nhau mà người dùng tương tác với biểu mẫu và các nội dung web khác và cung cấp các khuyến nghị để quản lý đầu vào người dùng, các ví dụ thực tế và các liên kết đến thêm thông tin.

Khi bạn phát triển các biểu mẫu phức tạp hơn và có tính tương tác hơn hoặc các tính năng giao diện người dùng khác, có nhiều phần tử HTML và API JavaScript mà bạn có thể muốn điều tra. Ví dụ, bạn có thể muốn tạo các điều khiển biểu mẫu tùy chỉnh yêu cầu các phần tử không có ngữ nghĩa để có thể chỉnh sửa nội dung. Bạn có thể muốn hỗ trợ sự kiện chạm, xác định hoặc kiểm soát hướng màn hình, làm cho biểu mẫu chiếm toàn bộ màn hình, hoặc bật tính năng kéo và thả. Hướng dẫn này giới thiệu tất cả các tính năng này và định hướng bạn đến thêm thông tin về từng chủ đề.

Để cung cấp trải nghiệm tốt cho số lượng người dùng lớn nhất, bạn cần hỗ trợ nhiều phương thức đầu vào, bao gồm chuột, bàn phím, chạm bằng ngón tay, v.v. Các cơ chế đầu vào có sẵn phụ thuộc vào khả năng của thiết bị chạy ứng dụng.

Bạn nên luôn chú ý đến khả năng tiếp cận bàn phím — nhiều người dùng web chỉ sử dụng bàn phím để điều hướng các trang web và ứng dụng, và việc khóa họ khỏi chức năng của bạn là một ý tưởng tệ.

## Các chủ đề được đề cập

- Để hỗ trợ màn hình cảm ứng, [sự kiện chạm](/en-US/docs/Web/API/Touch_events) diễn giải hoạt động ngón tay trên giao diện người dùng dựa trên chạm từ thiết bị di động, đến bảng điều khiển tủ lạnh, đến màn hình kiosk bảo tàng.
- [API Fullscreen](/en-US/docs/Web/API/Fullscreen_API) cho phép bạn hiển thị nội dung của mình ở chế độ toàn màn hình, điều này cần thiết nếu biểu mẫu của bạn đang được phục vụ trên tủ lạnh hoặc kiosk bảo tàng.
- Khi bạn cần tạo điều khiển biểu mẫu tùy chỉnh, chẳng hạn như trình chỉnh sửa văn bản phong phú, thuộc tính [`contentEditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) cho phép tạo các điều khiển có thể chỉnh sửa từ các phần tử HTML thường không thể chỉnh sửa.
- [API Drag and Drop](/en-US/docs/Web/API/HTML_Drag_and_Drop_API) cho phép người dùng kéo các phần tử xung quanh trang và thả chúng ở các vị trí khác nhau. Điều này có thể giúp cải thiện trải nghiệm người dùng khi chọn tệp để tải lên hoặc sắp xếp lại các mô-đun nội dung trong trang.
- Khi hướng màn hình quan trọng đối với bố cục của bạn, bạn có thể sử dụng [truy vấn phương tiện CSS](/en-US/docs/Web/CSS/Reference/At-rules/@media/orientation) để tạo kiểu cho biểu mẫu của bạn dựa trên hướng trình duyệt, hoặc thậm chí sử dụng [API Screen Orientation](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation) để đọc trạng thái hướng màn hình và thực hiện các hành động khác.

Các phần sau cung cấp một bộ khuyến nghị và thực hành tốt nhất để cho phép tập hợp người dùng rộng nhất có thể sử dụng các trang web và ứng dụng của bạn.

## Hỗ trợ các phương thức đầu vào phổ biến

### Bàn phím

Hầu hết người dùng sẽ sử dụng bàn phím để nhập dữ liệu vào các điều khiển biểu mẫu của bạn. Một số người cũng sẽ sử dụng bàn phím để điều hướng đến các điều khiển biểu mẫu đó. Để có thể truy cập và để trải nghiệm người dùng tốt hơn, điều quan trọng là phải [nhãn đúng tất cả các điều khiển biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Your_first_form#the_label_input_and_textarea_elements). Khi mỗi điều khiển biểu mẫu có {{htmlelement("label")}} được liên kết chính xác, biểu mẫu của bạn sẽ hoàn toàn có thể truy cập cho tất cả mọi người, đặc biệt là bất kỳ ai điều hướng biểu mẫu của bạn bằng bàn phím, trình đọc màn hình, và có thể không có màn hình nào cả.

Nếu bạn muốn thêm hỗ trợ bàn phím bổ sung, chẳng hạn như xác thực điều khiển biểu mẫu khi một phím cụ thể được nhấn, bạn có thể sử dụng trình lắng nghe sự kiện để nắm bắt và phản ứng với các sự kiện bàn phím. Ví dụ, nếu bạn muốn thêm điều khiển khi bất kỳ phím nào được nhấn, bạn cần thêm trình lắng nghe sự kiện trên đối tượng window:

```js
window.addEventListener("keydown", handleKeyDown);
window.addEventListener("keyup", handleKeyUp);
```

`handleKeyDown` và `handleKeyUp` là các hàm xác định logic điều khiển cần thực thi khi các sự kiện `keydown` và `keyup` được kích hoạt.

> [!NOTE]
> Xem hướng dẫn [sự kiện DOM](/en-US/docs/Web/API/Document_Object_Model/Events) và tham chiếu {{domxref("KeyboardEvent")}} để tìm hiểu thêm về các sự kiện bàn phím.

### Chuột

Bạn cũng có thể bắt các sự kiện chuột và con trỏ khác. Các sự kiện xảy ra khi người dùng tương tác với thiết bị trỏ như chuột được đại diện bởi Giao diện DOM {{domxref("MouseEvent")}}. Các sự kiện chuột phổ biến bao gồm [`click`](/en-US/docs/Web/API/Element/click_event), [`dblclick`](/en-US/docs/Web/API/Element/dblclick_event), [`mouseup`](/en-US/docs/Web/API/Element/mouseup_event) và [`mousedown`](/en-US/docs/Web/API/Element/mousedown_event). Danh sách tất cả các sự kiện sử dụng Giao diện Sự kiện Chuột được cung cấp trong hướng dẫn [sự kiện DOM](/en-US/docs/Web/API/Document_Object_Model/Events#event_index).

Khi thiết bị đầu vào là chuột, bạn cũng có thể kiểm soát đầu vào người dùng thông qua API Pointer Lock và thực hiện Drag & Drop (xem bên dưới). Bạn cũng có thể [sử dụng CSS để kiểm tra hỗ trợ thiết bị con trỏ](/en-US/docs/Learn_web_development/Core/CSS_layout/Media_queries#use_of_pointing_devices).

### Chạm bằng ngón tay

Để cung cấp hỗ trợ bổ sung cho các thiết bị màn hình cảm ứng, tốt nhất là xem xét các khả năng khác nhau về độ phân giải màn hình và đầu vào người dùng. [Sự kiện chạm](/en-US/docs/Web/API/Touch_events) có thể giúp bạn triển khai các phần tử tương tác và các cử chỉ tương tác phổ biến trên các thiết bị màn hình cảm ứng.

Nếu bạn muốn sử dụng sự kiện chạm, bạn cần thêm trình lắng nghe sự kiện và chỉ định các hàm xử lý, sẽ được gọi khi sự kiện được kích hoạt:

```js
element.addEventListener("touchstart", handleStart);
element.addEventListener("touchcancel", handleCancel);
element.addEventListener("touchend", handleEnd);
element.addEventListener("touchmove", handleMove);
```

trong đó `element` là phần tử DOM bạn muốn đăng ký sự kiện chạm.

> [!NOTE]
> Để biết thêm thông tin về những gì bạn có thể làm với sự kiện chạm, vui lòng đọc [hướng dẫn sự kiện chạm](/en-US/docs/Web/API/Touch_events) của chúng ta.

### Sự kiện con trỏ

Chuột không phải là thiết bị trỏ duy nhất. Thiết bị của người dùng có thể tích hợp nhiều dạng đầu vào, như chuột, chạm bằng ngón tay và nhập bút. Mỗi con trỏ này có kích thước khác nhau. [API Pointer Events](/en-US/docs/Web/API/Pointer_events) có thể hữu ích nếu bạn cần quản lý sự kiện trên các thiết bị bằng cách chuẩn hóa việc xử lý từng thiết bị. Con trỏ có thể là bất kỳ điểm tiếp xúc nào trên màn hình được tạo bởi con trỏ chuột, bút, chạm (bao gồm đa chạm), hoặc thiết bị đầu vào trỏ khác.

Các sự kiện để xử lý đầu vào con trỏ chung trông rất giống những sự kiện dành cho chuột: `pointerdown`, `pointermove`, `pointerup`, `pointerover`, `pointerout`, v.v. [Giao diện `PointerEvent`](/en-US/docs/Web/API/PointerEvent) cung cấp tất cả các chi tiết bạn có thể muốn nắm bắt về thiết bị con trỏ, bao gồm kích thước, áp lực và góc của nó.

## Triển khai điều khiển

### Hướng màn hình

Nếu bạn cần bố cục hơi khác nhau tùy thuộc vào việc người dùng ở chế độ dọc hay ngang, bạn có thể sử dụng [truy vấn phương tiện CSS](/en-US/docs/Learn_web_development/Core/CSS_layout/Media_queries#media_feature_rules) để xác định CSS cho các bố cục khác nhau hoặc chiều rộng điều khiển biểu mẫu dựa trên kích thước hoặc hướng của màn hình khi [tạo kiểu biểu mẫu web](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms).

Khi hướng màn hình quan trọng đối với biểu mẫu của bạn, bạn có thể đọc trạng thái hướng màn hình, được thông báo khi trạng thái này thay đổi, và có thể khóa hướng màn hình vào một trạng thái cụ thể (thường là dọc hoặc ngang) thông qua [API Screen Orientation](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation).

- Dữ liệu hướng có thể được lấy thông qua {{domxref("screenOrientation.type")}} hoặc với CSS thông qua tính năng phương tiện [`orientation`](/en-US/docs/Web/CSS/Reference/At-rules/@media/orientation).
- Khi hướng màn hình thay đổi, sự kiện {{domxref("ScreenOrientation.change_event", "change")}} được kích hoạt trên đối tượng screen.
- Việc khóa hướng màn hình được thực hiện bằng cách gọi phương thức {{domxref("ScreenOrientation.lock()")}}.
- Phương thức {{domxref("ScreenOrientation.unlock()")}} xóa tất cả các khóa màn hình trước đó đã được đặt.

> [!NOTE]
> Thêm thông tin về API Screen Orientation có thể được tìm thấy trong [Quản lý hướng màn hình](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation).

### Toàn màn hình

Nếu bạn cần trình bày biểu mẫu của mình ở chế độ toàn màn hình, chẳng hạn như khi biểu mẫu của bạn được hiển thị trên kiosk bảo tàng, trạm thu phí, hoặc thực sự bất kỳ giao diện người dùng hiển thị công khai nào, bạn có thể làm như vậy bằng cách gọi {{domxref("Element.requestFullscreen()")}} trên phần tử đó:

```js
const elem = document.getElementById("myForm");
if (elem.requestFullscreen) {
  elem.requestFullscreen();
}
```

> [!NOTE]
> Để tìm hiểu thêm về việc thêm chức năng toàn màn hình vào ứng dụng của bạn, hãy đọc tài liệu của chúng ta về [sử dụng chế độ toàn màn hình](/en-US/docs/Web/API/Fullscreen_API).

### Drag & Drop

Một tương tác người dùng phổ biến là kéo vật lý các phần tử để thả ở nơi khác trên màn hình. Drag and drop có thể giúp cải thiện trải nghiệm người dùng khi chọn tệp để tải lên hoặc sắp xếp lại các mô-đun nội dung trong trang. Có một API cho điều đó!

[API Drag & Drop](/en-US/docs/Web/API/HTML_Drag_and_Drop_API) cho phép người dùng nhấp và giữ nút chuột trên một phần tử, kéo nó đến một vị trí khác và thả nút chuột để thả phần tử đó ở đó.

Đây là một ví dụ cho phép một phần nội dung được kéo.

```html
<div draggable="true">This text <strong>may</strong> be dragged.</div>
```

```js
document.querySelector("div").addEventListener("dragstart", (event) => {
  event.dataTransfer.setData("text/plain", "This text may be dragged.");
});
```

trong đó chúng ta:

- Đặt thuộc tính [`draggable`](/en-US/docs/Web/HTML/Reference/Global_attributes/draggable) thành `true` trên phần tử mà bạn muốn làm có thể kéo.
- Thêm trình lắng nghe cho sự kiện [`dragstart`](/en-US/docs/Web/API/HTMLElement/dragstart_event) và đặt dữ liệu kéo trong trình lắng nghe này.

> [!NOTE]
> Bạn có thể tìm thêm thông tin trong [Tài liệu Drag & Drop của MDN](/en-US/docs/Web/API/HTML_Drag_and_Drop_API).

### contentEditable

Thông thường, bạn nên sử dụng {{HTMLElement("textarea")}} hoặc loại {{HTMLElement("input")}} thích hợp trong {{HTMLElement("form")}} để thu thập dữ liệu từ người dùng, cùng với {{HTMLElement("label")}} mô tả. Nhưng các phần tử này có thể không đáp ứng nhu cầu của bạn. Ví dụ, các trình chỉnh sửa văn bản phong phú nắm bắt văn bản in nghiêng, đậm và bình thường, nhưng không có điều khiển biểu mẫu gốc nào nắm bắt văn bản phong phú. Trường hợp sử dụng này yêu cầu bạn tạo điều khiển tùy chỉnh có thể tạo kiểu _và_ có thể chỉnh sửa. Có một thuộc tính cho điều đó!

Bất kỳ phần tử DOM nào cũng có thể được làm có thể chỉnh sửa trực tiếp bằng thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

```css hidden
div {
  width: 300px;
  height: 130px;
  border: 1px solid gray;
}
```

```html
<div contenteditable="true">This text can be edited by the user.</div>
```

Thuộc tính `contenteditable` tự động thêm phần tử vào thứ tự tab mặc định của tài liệu, có nghĩa là thuộc tính [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) không cần được thêm. Tuy nhiên, khi sử dụng các phần tử không có ngữ nghĩa để nhập dữ liệu khi [tạo các điều khiển biểu mẫu tùy chỉnh của riêng bạn](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls), bạn sẽ cần thêm JavaScript và [ARIA](/en-US/docs/Web/Accessibility/ARIA) để trang bị lại phần tử với chức năng điều khiển biểu mẫu cho mọi thứ khác.

Để cung cấp trải nghiệm người dùng tốt, bất kỳ điều khiển biểu mẫu tùy chỉnh nào bạn tạo phải có thể truy cập và hoạt động như các điều khiển biểu mẫu gốc:

- [`role`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles), [nhãn](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) và [mô tả](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) của phần tử cần được thêm bằng ARIA.
- Tất cả các phương thức đầu vào người dùng cần được hỗ trợ, bao gồm [bàn phím](#bàn_phím), [chuột](#chuột), [chạm](#chạm_bằng_ngón_tay) và [sự kiện con trỏ](#sự_kiện_con_trỏ), tất cả được mô tả ở trên.
- JavaScript được yêu cầu để xử lý chức năng như [xác thực](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation), [gửi](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data) và [lưu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_forms_through_JavaScript) nội dung được cập nhật bởi người dùng.

{{EmbedLiveSample("contentEditable")}}

> [!NOTE]
> Các ví dụ và các tài nguyên khác có thể được tìm thấy trong [Hướng dẫn Content Editable](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

## Hướng dẫn

- [Hướng dẫn sự kiện chạm](/en-US/docs/Web/API/Touch_events)
- [Quản lý hướng màn hình](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation)
- [Sử dụng chế độ toàn màn hình](/en-US/docs/Web/API/Fullscreen_API)
- [Hướng dẫn thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Xác thực biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Gửi biểu mẫu qua JavaScript](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_forms_through_JavaScript)

## Tham chiếu

- Giao diện {{domxref("MouseEvent")}}
- Giao diện {{domxref("KeyboardEvent")}}
- API [Sự kiện chạm](/en-US/docs/Web/API/Touch_events)
- API [Pointer Lock](/en-US/docs/Web/API/Pointer_Lock_API)
- API [Screen Orientation](/en-US/docs/Web/API/CSS_Object_Model/Managing_screen_orientation)
- API [Fullscreen](/en-US/docs/Web/API/Fullscreen_API)
- API [Drag & Drop](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- Thuộc tính HTML [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable)
