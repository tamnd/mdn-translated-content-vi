---
title: Vai trò WAI-ARIA
short-title: Roles
slug: Web/Accessibility/ARIA/Reference/Roles
page-type: landing-page
sidebar: accessibilitysidebar
---

Các vai trò ARIA cung cấp ý nghĩa ngữ nghĩa cho nội dung, cho phép trình đọc màn hình và các công cụ khác trình bày và hỗ trợ tương tác với một đối tượng theo cách phù hợp với kỳ vọng của người dùng về loại đối tượng đó. Các vai trò <abbr>ARIA</abbr> có thể được dùng để mô tả những phần tử không tồn tại nguyên gốc trong HTML hoặc có tồn tại nhưng chưa được trình duyệt hỗ trợ đầy đủ.

Theo mặc định, nhiều phần tử ngữ nghĩa trong HTML đã có vai trò; ví dụ, `<input type="radio">` có vai trò "radio". Các phần tử không mang ngữ nghĩa trong HTML thì không có vai trò; `<div>` và `<span>` nếu không được bổ sung ngữ nghĩa sẽ trả về `null`. Thuộc tính `role` có thể cung cấp ngữ nghĩa.

Các vai trò ARIA được thêm vào phần tử HTML bằng `role="role type"`, trong đó _role type_ là tên của một vai trò trong đặc tả ARIA. Một số vai trò yêu cầu phải đi kèm các trạng thái hoặc thuộc tính ARIA liên quan; những vai trò khác chỉ hợp lệ khi được dùng cùng các vai trò khác.

Ví dụ, `<ul role="tabpanel">` sẽ được trình đọc màn hình đọc là "tab panel". Tuy nhiên, nếu tab panel đó không có các tab lồng bên trong, thì phần tử có vai trò tabpanel thực ra không phải là một tab panel và khả năng truy cập đã bị ảnh hưởng tiêu cực.

[Các trạng thái và thuộc tính ARIA](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes) liên quan đến từng vai trò được liệt kê trong các trang của vai trò đó, và mỗi thuộc tính cũng có một trang riêng.

## Các loại vai trò ARIA

Có 6 nhóm vai trò ARIA:

### 1. Vai trò cấu trúc tài liệu

Các vai trò Cấu trúc tài liệu được dùng để cung cấp mô tả cấu trúc cho một phần nội dung. Phần lớn các vai trò này không còn nên dùng nữa vì trình duyệt hiện đã hỗ trợ các phần tử HTML ngữ nghĩa có cùng ý nghĩa. Những vai trò không có phần tử HTML tương ứng, chẳng hạn `presentation`, `toolbar` và `tooltip`, cung cấp thông tin về cấu trúc tài liệu cho các công nghệ hỗ trợ như trình đọc màn hình khi không có thẻ HTML gốc tương đương.

- [`toolbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/toolbar_role)
- [`tooltip`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tooltip_role)
- [`feed`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/feed_role)
- [`math`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/math_role)
- [`presentation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role) / [`none`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role)
- [`note`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/note_role)

Đối với hầu hết các vai trò cấu trúc tài liệu, đều có các phần tử HTML ngữ nghĩa tương đương và được hỗ trợ. Tránh dùng:

- [`application`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/application_role)
- [`article`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role) (dùng {{HTMLElement('article')}})
- [`cell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/cell_role) (dùng {{HTMLElement('td')}})
- [`columnheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/columnheader_role) (dùng `{{HTMLElement('th', '&lt;th scope="col">')}}`)
- [`definition`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/definition_role) (dùng {{HTMLElement('dfn')}})
- [`directory`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/directory_role)
- [`document`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role)
- [`figure`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/figure_role) (dùng {{HTMLElement('figure')}} thay thế)
- [`group`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role)
- [`heading`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/heading_role) (dùng {{HTMLElement("Heading_Elements", "h1")}} đến {{HTMLElement("Heading_Elements", "h6")}})
- [`img`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/img_role) (dùng {{HTMLElement('img')}} hoặc {{HTMLElement('picture')}} thay thế)
- [`list`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/list_role) (dùng {{HTMLElement('ul')}} hoặc {{HTMLElement('ol')}} thay thế)
- [`listitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role) (dùng {{HTMLElement('li')}} thay thế)
- [`meter`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/meter_role) (dùng {{HTMLElement('meter')}} thay thế)
- [`row`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/row_role) (dùng {{HTMLElement('tr')}} với {{HTMLElement('table')}})
- [`rowgroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowgroup_role) (dùng {{HTMLElement('thead')}}, {{HTMLElement('tfoot')}} và {{HTMLElement('tbody')}})
- [`rowheader`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/rowheader_role) (dùng `{{HTMLElement('th','&lt;th scope="row">')}}`)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) (dùng {{HTMLElement('hr')}} nếu nó không thể nhận tiêu điểm)
- [`table`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/table_role) (dùng {{HTMLElement('table')}})
- [`term`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/term_role) (dùng {{HTMLElement('dfn')}})

Các vai trò này được liệt kê để đầy đủ, nhưng trong hầu hết trường hợp thì hiếm khi, nếu có, chúng hữu ích:

- [`associationlist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`associationlistitemkey`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`associationlistitemvalue`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`blockquote`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`caption`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`code`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`deletion`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`emphasis`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`insertion`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`paragraph`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`strong`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`subscript`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`superscript`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)
- [`time`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles)

### 2. Vai trò widget

Các vai trò widget được dùng để xác định các mẫu tương tác phổ biến. Giống như các vai trò cấu trúc tài liệu, một số vai trò widget có cùng ngữ nghĩa với các phần tử HTML gốc được hỗ trợ tốt, vì vậy nên tránh dùng chúng. Khác biệt chính là vai trò widget thường cần JavaScript để tương tác, trong khi vai trò cấu trúc tài liệu thường thì không.

- [`scrollbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/scrollbar_role)
- [`searchbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/searchbox_role)
- [`separator`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role) (khi có thể nhận tiêu điểm)
- [`slider`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role)
- [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role)
- [`switch`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/switch_role)
- [`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role)
- [`tabpanel`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tabpanel_role)
- [`treeitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role)

Tránh dùng [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role), [`checkbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role), [`gridcell`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/gridcell_role), [`link`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/link_role), [`menuitem`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role), [`menuitemcheckbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role), [`menuitemradio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role), [`option`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role), [`progressbar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/progressbar_role), [`radio`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role), và [`textbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role), vốn được liệt kê để đầy đủ. Đối với phần lớn chúng, các tương đương ngữ nghĩa với khả năng tương tác có thể truy cập đều đã có và được hỗ trợ. Xem tài liệu của từng vai trò để biết thêm.

#### Vai trò widget tổ hợp

- [`combobox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role)
- [`menu`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menu_role)
- [`menubar`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menubar_role)
- [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)
- [`tree`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tree_role)
- [`treegrid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treegrid_role)

Tránh dùng [`grid`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/grid_role), [`listbox`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listbox_role), và [`radiogroup`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role), vốn được liệt kê để đầy đủ. Xem tài liệu của từng vai trò để biết thêm.

Lưu ý rằng còn có một vai trò widget khác (`role="widget"`), đây là một vai trò trừu tượng và không nằm trong nhóm vai trò widget.

### 3. Vai trò landmark

Vai trò landmark cung cấp cách xác định tổ chức và cấu trúc của một trang web. Bằng cách phân loại và gắn nhãn các phần của trang, thông tin cấu trúc được thể hiện bằng bố cục trực quan sẽ được biểu diễn dưới dạng chương trình. Trình đọc màn hình dùng các vai trò landmark để cung cấp điều hướng bằng bàn phím tới những phần quan trọng của trang. Hãy dùng tiết chế. Quá nhiều vai trò landmark sẽ tạo ra "nhiễu" trong trình đọc màn hình, khiến việc hiểu bố cục tổng thể của trang trở nên khó khăn.

- [`banner`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/banner_role) (tài liệu {{HTMLElement('header')}})
- [`complementary`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role) ({{HTMLElement('aside')}})
- [`contentinfo`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/contentinfo_role) (tài liệu {{HTMLElement('footer')}})
- [`form`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/form_role) ({{HTMLElement('form')}})
- [`main`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role) ({{HTMLElement('main')}})
- [`navigation`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role) ({{HTMLElement('nav')}})
- [`region`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role) ({{HTMLElement('section')}})
- [`search`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/search_role) ({{HTMLElement('search')}})

### 4. Vai trò vùng trực tiếp

Các vai trò vùng trực tiếp được dùng để xác định những phần tử có nội dung sẽ thay đổi động. Người dùng nhìn thấy có thể nhận ra các thay đổi động khi chúng dễ thấy về mặt trực quan. Những vai trò này giúp người dùng có thị lực kém và người mù biết nội dung đã được cập nhật. Các công nghệ hỗ trợ, như trình đọc màn hình, có thể được cấu hình để thông báo các thay đổi nội dung động:

- [`alert`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alert_role)
- [`log`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/log_role)
- [`marquee`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/marquee_role)
- [`status`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/status_role)
- [`timer`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/timer_role)

### 5. Vai trò cửa sổ

Vai trò cửa sổ xác định các cửa sổ con của cửa sổ tài liệu chính, nằm trong cùng một cửa sổ, chẳng hạn hộp thoại phương thức bật lên:

- [`alertdialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/alertdialog_role)
- [`dialog`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/dialog_role)

### 6. Vai trò trừu tượng

Các vai trò trừu tượng chỉ dành cho trình duyệt dùng để tổ chức và tinh gọn tài liệu. Nhà phát triển viết markup HTML không nên dùng chúng. Làm vậy sẽ không truyền đạt được thông tin có ý nghĩa nào cho các công nghệ hỗ trợ hoặc người dùng.

Tránh dùng [`command`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/command_role), [`composite`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/composite_role), [`input`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/input_role), [`landmark`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/landmark_role), [`range`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/range_role), [`roletype`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/roletype_role), [`section`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/section_role), [`sectionhead`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/sectionhead_role), [`select`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/select_role), [`structure`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structure_role), [`widget`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/widget_role), và [`window`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/window_role).

> [!NOTE]
> Đừng dùng các vai trò trừu tượng trong trang web và ứng dụng của bạn. Chúng dành cho trình duyệt. Chúng chỉ được đưa vào để tham khảo.

> [!WARNING]
> "Các vai trò trừu tượng được dùng cho ontology. Tác giả **KHÔNG ĐƯỢC** dùng các vai trò trừu tượng trong nội dung." - Đặc tả <abbr>WAI-ARIA</abbr>

## Các vai trò được định nghĩa trên MDN

Các trang tham chiếu sau đây bao gồm những vai trò WAI-ARIA được thảo luận trên <abbr>MDN</abbr>.

{{SubpagesWithSummaries}}

## Xem thêm

- [Using ARIA: Roles, States, and Properties](/en-US/docs/Web/Accessibility/ARIA/Guides/Techniques)
- [ARIA states and properties](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes)
