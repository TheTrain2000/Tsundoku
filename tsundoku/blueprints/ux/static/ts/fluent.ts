import "intl-pluralrules";
import { FluentBundle, FluentResource } from "@fluent/bundle";

export const getInjector = (resources: string[]) => {
  let locale: string = window["LOCALE"];

  let bundle = new FluentBundle(locale);
  let fallbackBundle = new FluentBundle("en");

  for (const resource of resources) {
    let key = `${locale}/${resource}.ftl`;
    let ftl_resource = new FluentResource(window["TRANSLATIONS"][key]);
    bundle.addResource(ftl_resource);

    key = `en/${resource}.ftl`;
    ftl_resource = new FluentResource(window["TRANSLATIONS"][key]);
    fallbackBundle.addResource(ftl_resource);
  }

  let injector = (key: string, ctx: any = {}) => {
    let msg = bundle.getMessage(key);
    if (typeof msg !== "undefined" && msg.value)
      return bundle.formatPattern(msg.value, ctx);
    else msg = fallbackBundle.getMessage(key);
    if (typeof msg !== "undefined" && msg.value)
      return fallbackBundle.formatPattern(msg.value, ctx);

    if (typeof msg === "undefined")
      console.error(
        `Key ${key} missing completely from desired and fallback locales.`
      );
    return key;
  };

  return injector;
};
