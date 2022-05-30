//----------------------------------------------
//            Realistic Car Controller
//
// Copyright © 2014 - 2021 BoneCracker Games
// http://www.bonecrackergames.com
// Buğra Özdoğanlar
//
//----------------------------------------------

using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using UnityEngine.EventSystems;

/// <summary>
/// UI input (float) receiver from UI Button. 
/// </summary>
[AddComponentMenu("BoneCracker Games/Realistic Car Controller/UI/Mobile/RCC UI Controller Button")]
public class RCC_UIController : MonoBehaviour, IPointerDownHandler, IPointerUpHandler {

	// Getting an Instance of Main Shared RCC Settings.
	#region RCC Settings Instance

	private RCC_Settings RCCSettingsInstance;
	private RCC_Settings RCCSettings {
		get {
			if (RCCSettingsInstance == null) {
				RCCSettingsInstance = RCC_Settings.Instance;
				return RCCSettingsInstance;
			}
			return RCCSettingsInstance;
		}
	}

	#endregion

	private Button button;
	private Slider slider;

	internal float input;
	private float sensitivity{get{return RCCSettings.UIButtonSensitivity;}}
	private float gravity{get{return RCCSettings.UIButtonGravity;}}
	public bool pressing;
	private Rigidbody RCCV3rigidbody;
	private RCC_CarControllerV3 RCCV3;
	private bool brakeinput;
	private bool brakepress;
	void Awake(){

		button = GetComponent<Button> ();
		slider = GetComponent<Slider> ();
        RCCV3rigidbody = Toolbox.GameplayController.SelectedVehiclePrefab.GetComponent<Rigidbody>();
        RCCV3 = Toolbox.GameplayController.SelectedVehiclePrefab.GetComponent<RCC_CarControllerV3>();
    }

	public void OnPointerDown(PointerEventData eventData){
		
		pressing = true;

	}

	public void OnPointerUp(PointerEventData eventData){
		 
		pressing = false;
		
	}

	void OnPress (bool isPressed){

		if(isPressed)
			pressing = true;
		else
			pressing = false;

	}

	void Update(){

		if (button && !button.interactable) {
			
			pressing = false;
			input = 0f;
			return;

		}

		if (slider && !slider.interactable) {

			pressing = false;
			input = 0f;
			slider.value = 0f;
			return;

		}

		if (slider) {

			if(pressing)
				input = slider.value;
			else
				input = 0f;

			slider.value = input;

		} else {

			if (pressing)
				input += Time.deltaTime * sensitivity;
			else
				input -= Time.deltaTime * gravity;

		}

		if(input < 0f)
			input = 0f;
		
		if(input > 1f)
			input = 1f;
        if (brakeinput && pressing)
        {
            if (RCCV3.direction == -1)
                RCCV3rigidbody.drag = 0.05f;
            else
                if (RCCV3rigidbody.drag < 2)
                RCCV3rigidbody.drag += 0.01f;
        }
        if (!brakeinput && brakepress)
        {
            RCCV3rigidbody.drag = 0.05f;
            brakepress = false;
        }
    }
	public void Onpress_Brake()
	{
		brakeinput = true;
		if (RCCV3.goingFalldown)
			GamePlayManager.inst.Resetvehicle();
		//print("Dir :"+RCCV3.direction);

	}
	public void Onpress_ReleaseBrake()
	{
		brakeinput = false;
		brakepress = true;
	}
	void OnDisable(){

		input = 0f;
		pressing = false;

	}

}
