var None = null;

function submitAddWebhookForm(event) {
    event.preventDefault();
    let url = $(this).closest("form").attr("action");
    let method = $(this).closest("form").attr("method");
    let data = $(this).closest("form").serialize();

    $.ajax(
        {
            url: url,
            type: method,
            data: data,
            success: function (data) {
                location.reload();
            },
            error: function (jqXHR, status, error) {
                alert("There was an error processing the request.");
            }
        }
    );
}


function openAddWebhookModal() {
    let form = $("#add-webhook-form");

    form.attr("action", "/api/webhooks");
    form.attr("method", "POST");
    form.on("submit", submitAddWebhookForm);

    $(document.documentElement).addClass("is-clipped");
    $("#add-webhook-modal").addClass("is-active");
};


function openEditWebhookModal(webhook) {
    let form = $("#edit-webhook-form");
    form.trigger("reset");

    $("#edit-webhook-form :input").each(function () {
        $(this).val(webhook[this.name])
    });

    form.attr("method", "PUT");
    form.attr("action", `/api/webhooks/${webhook.base_id}`);

    form.on("submit", submitAddWebhookForm);

    $(document.documentElement).addClass("is-clipped");
    $("#edit-webhook-modal").addClass("is-active");
}


function openDeleteWebhookModal(webhook) {
    $("#delete-webhook-button").on("click", function (e) {
        e.preventDefault();
        $.ajax(
            {
                url: `/api/webhooks/${webhook.base_id}`,
                type: "DELETE",
                success: function () {
                    location.reload();
                }
            }
        );
    });
    $("#item-to-delete-name").text(webhook.name);

    $(document.documentElement).addClass("is-clipped");
    $("#delete-webhook-modal").addClass("is-active");
}


function closeModals() {
    $(".modal").removeClass("is-active");
    $(document.documentElement).removeClass("is-clipped");
}


$(document).ready(function () {
    $('.notification .delete').each(function () {
        $(this).on("click", function () {
            $(this).parent().remove();
        })
    });
});