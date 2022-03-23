import { LightningElement, track } from "lwc";
import { createRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import ACCOUNT_NAME from "@salesforce/schema/Account.Name";

class Insert_account_lwc extends LightningElement {
  @track accountName;

  handlerAccountName(event) {
    this.accountName = event.target.value;
  }

  saveAccountName() {
    const fields = {};
    fields[ACCOUNT_NAME.fieldApiName] = this.accountName;
    const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };
    createRecord(recordInput)
      .then((success) => {
        console.log(`Exito: ${success}`);
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Éxito",
            message: "Se ha creado el vehiculo exitosamente",
            variant: "success"
          })
        );
        this.clearInputField();
      })
      .catch((error) => {
        console.log(`Error: ${error}`);
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error",
            message: "Ha ocurrido un error",
            variant: "Error"
          })
        );
      });
  }

  clearInputField() {
    this.accountName = "";
  }
}

export default Insert_account_lwc;
