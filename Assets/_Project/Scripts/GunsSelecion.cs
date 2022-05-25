using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[System.Serializable]
public class Gun {

    public string Name;
    public string Description;
    public GameObject GunObj;
    public int Price;
    public float RealPrice;
    public bool Unlocked;
}
public class GunsSelecion : MonoBehaviour
{
    public Text NameTxt;
    public Text DescriptionTxt;

    public GameObject BuyBtn;
    public Text PriceTxt;
    public GameObject RealBuyBtn;
    public Text RealPriceTxt;

    public Gun[] Guns;
    int currentIndex=0;
    public void Next()
    {
        currentIndex++;
        if (currentIndex >= Guns.Length)
            currentIndex = 0;
        RefreshWeapon();
    }
    public void Prev()
    {
        currentIndex--;
        if (currentIndex < 0)
            currentIndex = Guns.Length - 1;
        RefreshWeapon();
    }
    private void OnEnable ()
    {
        currentIndex = PlayerPrefs.GetInt("SelectedWeapon", 0);
        RefreshWeapon();
    }

    void RefreshWeapon()
    {
         PlayerPrefs.SetInt("CurrentWeapon", currentIndex);

        for(int i = 0;i<Guns.Length;i++)
        {
            if (Guns[i].GunObj != null)
                Guns[i].GunObj.SetActive(false);
            else
                Debug.LogWarning("The Gun you are trying to activate is not assigned in gun selection");
        }

        if (Guns[currentIndex].GunObj != null)
            Guns[currentIndex].GunObj.SetActive(true);
        else
            Debug.LogWarning("The Gun you are trying to activate is not assigned in gun selection");

        if (NameTxt)
            NameTxt.text = Guns[currentIndex].Name;
        if (DescriptionTxt)
            DescriptionTxt.text = Guns[currentIndex].Description;

        if (PlayerPrefs.GetInt("Owned"+ currentIndex.ToString(),0)==0 && !Guns[currentIndex].Unlocked)
        {
            // not bought or unlocked
            BuyBtn.SetActive(true);
            PriceTxt.text = Guns[currentIndex].Price.ToString();

            if (PlayerPrefs.GetInt("TotalCoins", 0) < Guns[currentIndex].Price)
                PriceTxt.color = Color.red;
            else
                PriceTxt.color = Color.white;

            RealBuyBtn.SetActive(true);
            RealPriceTxt.text = Guns[currentIndex].RealPrice.ToString();
        }
        else
        {
            BuyBtn.SetActive(false);
            RealBuyBtn.SetActive(false);
        }

    }
    public void Buy()
    {
        if (PlayerPrefs.GetInt("TotalCoins", 0) >= Guns[currentIndex].Price)
        {
            PlayerPrefs.SetInt("TotalCoins", PlayerPrefs.GetInt("TotalCoins", 0) - Guns[currentIndex].Price);
            PlayerPrefs.SetInt("Owned" + currentIndex.ToString(), 1);

            RefreshWeapon();
        }
    }
    public void RealBuy()
    {
        Buy();
    }


    private void OnDisable()
    {
        if(!(PlayerPrefs.GetInt("Owned" + currentIndex.ToString(), 0) == 0 && !Guns[currentIndex].Unlocked))
        {
            PlayerPrefs.SetInt("SelectedWeapon", currentIndex);
        }
    }
}
