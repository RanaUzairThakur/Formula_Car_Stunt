using UnityEngine;
using System.Collections;


public class SoundsManager1 : MonoBehaviour {

	public static SoundsManager1 _instance;
	[SerializeField] private float defaultSoundSourceVolume = 1;
	[SerializeField] private float defaultMusicSourceVolume = 1;

	[Header("Audio Sources")]
	public AudioSource soundSource;
	public AudioSource musicSource;

	[Header("BG Clips")]
	public AudioClip menuBG;
	public AudioClip[] gameBG;

	[Header("Sound Clips")]
	//public AudioClip IntroAnimation;
	public AudioClip buttonPress;
	
	 public AudioClip PlayButtonMainMenuclick;
	
	public AudioClip WinAppreciationsound;
	public AudioClip GameUIclicks;
	public AudioClip levelComplete;
	public AudioClip levelFail;

	public AudioClip Savepointclip;
	public AudioClip singleCoinsSound;
	
	private void Start()
    {

		
		_instance = this;
		DontDestroyOnLoad(this);
	}

    public void Pause(){

		this.soundSource.Pause ();
		this.musicSource.Pause();
	}

	public void UnPause(){

		this.soundSource.UnPause ();
		this.musicSource.UnPause();

	}

	public void PlaySound(AudioClip _clip){

		soundSource.PlayOneShot (_clip);
	}

	public void PlaySoundAfterStop(AudioClip _clip)
	{
		Stop_PlayingSound();
		soundSource.PlayOneShot(_clip);
	}

	public void Stop_PlayingSound(){
		soundSource.Stop ();
	}
	public void Stop_PlayingMusic(){
		musicSource.Stop ();
	}

	public void PlayMusic_Menu() {

		musicSource.clip = menuBG;
		musicSource.Play();
	}

	public void PlayMusic_Game(int i)
	{
		musicSource.clip = gameBG[i];
		musicSource.Play();

	}

	
	public void Set_MusicStatus(bool _val) {

		if (_val)
		{
			musicSource.volume = defaultMusicSourceVolume;
		}
		else { 
			musicSource.volume = 0;
		}
        //Toolbox.DB.Prefs.GameAudio = _val;
	}

	public void Set_SoundStatus(bool _val)
	{
		if (_val)
		{
			soundSource.volume = defaultSoundSourceVolume;
		}
		else
		{
			soundSource.volume = 0;
		}
       // Toolbox.DB.Prefs.GameSound= _val;
    }

	public void Set_SoundVolume(float _val)
	{
		soundSource.volume = _val;
	}

	public void Set_MusicVolume(float _val)
	{
		musicSource.volume = _val;
	}


}
